//
//
//  Created by Jacek Grygiel on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <CoreLocation/CLAvailability.h>
#import <MapKit/MapKit.h>

#define USER_CITYNAME_UPDATE_TIME 100.0
#define RUN_USER_LOCATION_UPDATING 0

@interface LocationService : NSObject<CLLocationManagerDelegate, UIAlertViewDelegate, NSURLConnectionDelegate>
{
    NSTimer *timer;
    CLLocation *_userLocation;
    NSString *_locatedAt;
}

@property(nonatomic, retain) CLLocation *userLocation;
@property(nonatomic, copy) NSString *locatedAt;

typedef void (^CLLocationManagerCompletion)(CLLocation *newLocation,CLLocation *oldLocation);
@property (strong,nonatomic) CLLocationManagerCompletion callbackCLManager;


- (void) startUpdatingUserLocationWithInterval:(NSTimeInterval) seconds;
- (void) stopUpdatingUserLocation;
- (NSString*)getAddressFromLatLonGeocoder:(double)pdblLatitude withLongitude:(double)pdblLongitude;
- (void) getAddressFromLonGeocoder:(double)pdblLatitude withLongitude:(double)pdblLongitude completionHandler:(CLGeocodeCompletionHandler)completionHandler;
- (NSString*)getAddressFromLatLonGoogleAPI:(double)pdblLatitude withLongitude:(double)pdblLongitude;
- (NSMutableArray*)allAddressFromLatLonGeocoder:(double)pdblLatitude withLongitude:(double)pdblLongitude;
- (NSString*) getCityNameForUserLocation;
- (void) updateUserLocation;
+ (LocationService*) sharedInstance;
+ (void)getUserLocationManager:(CLLocationManager*) locationManager WithCompletion:(CLLocationManagerCompletion) completion;

@end
