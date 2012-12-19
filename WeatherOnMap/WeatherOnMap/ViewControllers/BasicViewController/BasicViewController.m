//
//  BasicViewController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicViewController.h"
#import "LocationService.h"
#import "StationModel.h"
#import "WeatherAnnotation.h"
#import "WeatherCurrentCache.h"

@interface BasicViewController ()
@property(nonatomic, retain) MKMapView *mapView;
@end

@implementation BasicViewController
@synthesize mapView = _mapView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//lat	 latitude
//lon	 longitude
//cnt	 Limit the number of points in the selection
//callback	 functionName for JSONP calback. http://en.wikipedia.org/wiki/JSONP
//cluster	 Use server clustering of points. Possible values ​​are [yes, no]
//lang	 Language [ru, en, de, fr, es, it] if is posible

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.mapView = [[[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] autorelease];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.view addSubview:self.mapView];
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    CLLocationCoordinate2D centre = [self.mapView convertPoint:self.mapView.center toCoordinateFromView:self.view];
    
    
    
    
    CLLocationCoordinate2D leftTop = [self.mapView convertPoint:CGPointMake(self.mapView.frame.origin.x, self.mapView.frame.origin.y) toCoordinateFromView:self.view];
    CLLocationCoordinate2D rightBottom = [self.mapView convertPoint:CGPointMake(self.mapView.frame.origin.x+self.mapView.frame.size.width, self.mapView.frame.origin.y+self.mapView.frame.size.height) toCoordinateFromView:self.view];
    
    BBox bbox = BBoxMake(leftTop, rightBottom);
    
    
    WeatherBoxRequestModel *weatherRequest = [[WeatherBoxRequestModel alloc] init];
    weatherRequest.bbox = bbox;
    [[WeatherOnMapService sharedInstance] getWeatherByBBox:weatherRequest withCaller:self];
    [weatherRequest release];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didReceiveResponse:(BasicResponseModel*) basicResponse{
    CFAbsoluteTime timeC = CFAbsoluteTimeGetCurrent();
    WeatherBoxResponseModel *response = (WeatherBoxResponseModel*) basicResponse;
    for (WeatherBoxModel *model in response.list) {
        if ([[WeatherCurrentCache sharedInstance] addWeatherBoxModel:model]){
            WeatherAnnotation *annotation = [[[WeatherAnnotation alloc] init] autorelease];
            [annotation setCoordinate:CLLocationCoordinate2DMake(model.lat, model.lon)];
            annotation.weatherBoxModel = model;
            [self.mapView addAnnotation:annotation];
        }
    }
    NSLog(@"time = %f", CFAbsoluteTimeGetCurrent()-timeC);

}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString* weatherAnnotationIdentifier = @"weatherAnnotationIdentifier";
    WeatherAnnotation *weatherAnnotation = (WeatherAnnotation*) annotation;
    UIImageView *img = nil;
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:weatherAnnotationIdentifier];
    
    if (annotationView == nil)
    {
        annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:weatherAnnotationIdentifier] autorelease];
        
        annotationView.backgroundColor = [UIColor redColor];
        annotationView.frame = CGRectMake(0, 0, 30, 30);



    }
        
    annotationView.image = img.image;
    annotationView.annotation = annotation;

    return annotationView;
}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}

@end
