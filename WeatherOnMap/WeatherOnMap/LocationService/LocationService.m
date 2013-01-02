//
//  ReccoLocationService.m
//  recco-ios
//
//  Created by Jacek Grygiel on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LocationService.h"

@implementation LocationService
@synthesize callbackCLManager;
@synthesize userLocation = _userLocation;
@synthesize locatedAt = _locatedAt;
static LocationService *instance = nil;

+(LocationService*) sharedInstance
{
    if (!instance)
    {
		instance = [[self alloc] init];
        //ReccoService created 
        instance.userLocation = [[[CLLocation alloc] init] autorelease];
    }
	
	return instance; 
}

- (void)dealloc
{
    instance = nil;
    [super dealloc];
}

+ (void)getUserLocationManager:(CLLocationManager*) locationManager WithCompletion:(CLLocationManagerCompletion) completion{
    __block LocationService *delegate = [[LocationService alloc] init];
    delegate = ^(CLLocation *newLocation,CLLocation *oldLocation) {
        completion(newLocation,oldLocation);
        
        [locationManager stopUpdatingLocation];
        locationManager.delegate = nil;
        delegate = nil;
    };
    
    locationManager.delegate = delegate;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

-(NSString *)getAddressFromLatLonGoogleAPI:(double)pdblLatitude withLongitude:(double)pdblLongitude
{
    NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%f,%f&output=csv",pdblLatitude, pdblLongitude];
    NSError* error;
    NSString *locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSASCIIStringEncoding error:&error];
    locationString = [locationString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    return [locationString substringFromIndex:6];
}

- (void) getAddressFromLonGeocoder:(double)pdblLatitude withLongitude:(double)pdblLongitude completionHandler:(CLGeocodeCompletionHandler)completionHandler{
    CLGeocoder * geoCoder = [[[CLGeocoder alloc] init] autorelease];
    CLLocation *location = [[[CLLocation alloc] initWithLatitude:pdblLatitude longitude:pdblLongitude] autorelease];
    [geoCoder reverseGeocodeLocation:location completionHandler:completionHandler];

}

- (NSString*)getAddressFromLatLonGeocoder:(double)pdblLatitude withLongitude:(double)pdblLongitude{

    NSString *lat = [NSString stringWithFormat:@"%f",pdblLatitude];
    NSString *lon = [NSString stringWithFormat:@"%f",pdblLongitude];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:lat,lon, nil] forKeys:[NSArray arrayWithObjects:@"lat",@"lon", nil]];
    
    [self performSelectorOnMainThread:@selector(geocoding:) withObject:dict waitUntilDone:YES];
        
    return instance.locatedAt;
    
    
}
- (void) geocoding:(NSDictionary*) latlon{
    
    CLGeocoder * geoCoder = [[[CLGeocoder alloc] init] autorelease];
    CLLocation *location = [[[CLLocation alloc] initWithLatitude:[[latlon objectForKey:@"lat"] doubleValue] longitude:[[latlon objectForKey:@"lon"] doubleValue]] autorelease];
    
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {  
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        instance.locatedAt = [NSString stringWithFormat:@"%@, %@", [placemark name],[placemark locality]];
        if (instance.locatedAt == nil) {
            instance.locatedAt = [placemark description];
        }
    }];
}

- (void) updateUserLocation{
    CLLocationManager *manager = [[[CLLocationManager alloc] init] autorelease];
    [LocationService getUserLocationManager:manager WithCompletion:^(CLLocation *newLocation, CLLocation *oldLocation) {
        
        if (newLocation) {
            instance.userLocation = newLocation;
        }

        
    }];
    
}

- (void) startUpdatingUserLocationWithInterval:(NSTimeInterval) seconds{
    //[self updateUserLocation];
    timer = [[NSTimer scheduledTimerWithTimeInterval:seconds
                                     target:self
                                   selector:@selector(updateUserLocation)
                                   userInfo:nil
                                    repeats:YES] retain];
    
}

- (void) stopUpdatingUserLocation{
    [timer invalidate];
    timer = nil;
}

- (NSString*) getCityNameForUserLocation{
    CLLocationManager *manager = [[[CLLocationManager alloc] init] autorelease];
    static NSString *city;
    [LocationService getUserLocationManager:manager WithCompletion:^(CLLocation *newLocation, CLLocation *oldLocation) {
        city = [[LocationService sharedInstance] getAddressFromLatLonGeocoder:newLocation.coordinate.latitude withLongitude:newLocation.coordinate.longitude]; 
        
    }];
    return city;
}

-(NSMutableArray*)allAddressFromLatLonGeocoder:(double)pdblLatitude withLongitude:(double)pdblLongitude{
    
    CLGeocoder * geoCoder = [[[CLGeocoder alloc] init] autorelease];
    CLLocation *location = [[[CLLocation alloc] initWithLatitude:pdblLatitude longitude:pdblLongitude] autorelease];
    static NSMutableArray *cityNames;
    
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark * placemark in placemarks) {
            [cityNames addObject:[placemark locality]];
            
        }  

    }];
    
    
    
    return cityNames;
    
    
}

#pragma mark CLLocation delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    callbackCLManager(newLocation,oldLocation);
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    callbackCLManager(nil, nil);
}
@end
