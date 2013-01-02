//
//  LiveViewController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "LiveViewController.h"
#import "WeatherModel.h"
@interface LiveViewController ()
@property(nonatomic, retain) MKMapView *mapView;
@end

@implementation LiveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView = [[[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] autorelease];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.view addSubview:self.mapView];

}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[WeatherCurrentCache sharedInstance] clearCache];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark MapView delegates
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    CLLocationCoordinate2D centre = [self.mapView convertPoint:self.mapView.center toCoordinateFromView:self.view];
    WeatherRequestModel *weatherRequest = [[WeatherRequestModel alloc] init];
    weatherRequest.latitude = centre.latitude;
    weatherRequest.longitude = centre.longitude;
    weatherRequest.resultCountExpected = 100;
    weatherRequest.radius = 100000.0;
    [[WeatherOnMapService sharedInstance] getWeather:weatherRequest withCaller:self];
    [weatherRequest release];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString* weatherAnnotationIdentifier = @"weatherAnnotationIdentifier";
    WeatherAnnotation *weatherAnnotation = (WeatherAnnotation*) annotation;
    UIImageView *img = weatherAnnotation.weatherModel.weatherCondition.icon;
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:weatherAnnotationIdentifier];
    
    if (annotationView == nil)
    {
        annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:weatherAnnotationIdentifier] autorelease];
        
        annotationView.backgroundColor = [UIColor clearColor];
        annotationView.frame = CGRectMake(0, 0, 30, 30);
    }
    
    annotationView.image = img.image;
    annotationView.annotation = annotation;
    
    return annotationView;
}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}
- (void) didReceiveResponse:(BasicResponseModel*) basicResponse{
    CFAbsoluteTime timeC = CFAbsoluteTimeGetCurrent();
    WeatherResponseModel *response = (WeatherResponseModel*) basicResponse;
    
    NSMutableArray *annotations = [NSMutableArray array];
    for (WeatherModel *weather in response.list) {
        if ([[WeatherCurrentCache sharedInstance] addWeatherModel:weather]){
            WeatherAnnotation *annotation = [[[WeatherAnnotation alloc] init] autorelease];
            [annotation setCoordinate:CLLocationCoordinate2DMake(weather.lat, weather.lon)];
            annotation.weatherModel = weather;
            [annotations addObject:annotation];
        }
    }
    
    [self.mapView addAnnotations:annotations];
    NSLog(@"time = %f", CFAbsoluteTimeGetCurrent()-timeC);
    
}


@end
