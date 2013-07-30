//
//  LiveViewController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "LiveBoxViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AnnotationButton.h"
@interface LiveBoxViewController ()
@property(nonatomic, retain) MKMapView *mapView;
@end

@implementation LiveBoxViewController
@synthesize mapView = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        WeatherBoxRequestModel *weatherRequest = [[WeatherBoxRequestModel alloc] init];
        weatherRequest.bbox = BBoxMake(CLLocationCoordinate2DMake(90,-180.0), CLLocationCoordinate2DMake(-90, 180));
        [[WeatherOnMapService sharedInstance] getWeatherByBBox:weatherRequest withCaller:self];
        [weatherRequest release];
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
    CLLocationCoordinate2D leftTop = [self.mapView convertPoint:CGPointMake(self.mapView.frame.origin.x, self.mapView.frame.origin.y) toCoordinateFromView:self.view];
    CLLocationCoordinate2D rightBottom = [self.mapView convertPoint:CGPointMake(self.mapView.frame.origin.x+self.mapView.frame.size.width, self.mapView.frame.origin.y+self.mapView.frame.size.height) toCoordinateFromView:self.view];
    BBox bbox = BBoxMake(leftTop, rightBottom);
    WeatherBoxRequestModel *weatherRequest = [[WeatherBoxRequestModel alloc] init];
    weatherRequest.bbox = bbox;
    [[WeatherOnMapService sharedInstance] getWeatherByBBox:weatherRequest withCaller:self];
    [weatherRequest release];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
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
        AnnotationButton *annotationButtonInfo = [[AnnotationButton alloc] initWithFrame:annotationView.frame];
        annotationButtonInfo.model = weatherAnnotation;
        [annotationButtonInfo addTarget:self action:@selector(tapOnAnnotation:) forControlEvents:UIControlEventTouchUpInside];
        [annotationView addSubview:annotationButtonInfo];
    }
    
    annotationView.image = img.image;
    annotationView.frame = CGRectMake(0, 0, 30, 30);
    annotationView.annotation = annotation;
    
    return annotationView;

}

- (void) tapOnAnnotation:(id) sender{
    AnnotationButton *button = (AnnotationButton*)sender;
    WeatherAnnotation *annotation = (WeatherAnnotation*) button.model;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Details" message:annotation.weatherModel.description delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil];
    [alert show
     ];
    [alert release];
}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}
- (void) didReceiveResponse:(BasicResponseModel*) basicResponse{
    CFAbsoluteTime timeC = CFAbsoluteTimeGetCurrent();
    WeatherResponseModel *response = (WeatherResponseModel*) basicResponse;
    DebugLog(@"%d", response.list.count);

    time_t unixTime = (time_t) [[NSDate date] timeIntervalSince1970];

    
    NSMutableArray *annotations = [NSMutableArray array];
    for (WeatherModel *model in response.list) {
        NSLog(@"%ld minutes",(long)(unixTime - model.dt)/60);

        if ([[WeatherCurrentCache sharedInstance] addWeatherModel:model]){
            WeatherAnnotation *annotation = [[[WeatherAnnotation alloc] init] autorelease];
            [annotation setCoordinate:CLLocationCoordinate2DMake(model.lat, model.lon)];
            annotation.weatherModel = model;
            [annotations addObject:annotation];
        }
    }
    
    [self.mapView addAnnotations:annotations];
    NSLog(@"time = %f", CFAbsoluteTimeGetCurrent()-timeC);
    
}

@end
