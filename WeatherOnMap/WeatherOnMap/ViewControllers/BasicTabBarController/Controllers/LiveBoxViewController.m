//
//  LiveViewController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "LiveBoxViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface LiveBoxViewController ()
@property(nonatomic, retain) MKMapView *mapView;
@end

@implementation LiveBoxViewController
@synthesize mapView = _mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

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

//    UIWebView *webview = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] autorelease];
//    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://openweathermap.org/help/tiles.html?opacity=0.6&l=wind"]]];
//    [self.view addSubview:webview];

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
    
    static NSString* weatherAnnotationIdentifier = @"weatherAnnotationIdentifier";
    UIImageView *img = nil;
    WeatherBoxAnnotation *annotationView = (WeatherBoxAnnotation *)[mapView dequeueReusableAnnotationViewWithIdentifier:weatherAnnotationIdentifier];
    
    if (annotationView == nil)
    {
        annotationView = [[[WeatherBoxAnnotation alloc] initWithAnnotation:annotation reuseIdentifier:weatherAnnotationIdentifier] autorelease];
        WeatherBoxAnnotation *previousOne = (WeatherBoxAnnotation*) annotation;
        annotationView.weatherBoxModel = previousOne.weatherBoxModel;
        annotationView.backgroundColor = [UIColor clearColor];
        annotationView.layer.borderWidth = 1.0;
        annotationView.frame = CGRectMake(0, 0, 30, 30);
        UIButton *annotationButton = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)] autorelease];
        [annotationButton addTarget:self action:@selector(tapOnAnnotation:) forControlEvents:UIControlEventTouchUpInside];
        annotationButton.backgroundColor = [UIColor clearColor];
        [annotationView addSubview:annotationButton];
        
        
    }
    
    annotationView.image = img.image;
    annotationView.annotation = annotation;
    
    return annotationView;
}

- (void) tapOnAnnotation:(id) sender{
    UIButton *button = sender;
    WeatherBoxAnnotation *annotation = (WeatherBoxAnnotation*) button.superview;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Details" message:annotation.weatherBoxModel.description delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil];
    [alert show
     ];
    [alert release];
}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}
- (void) didReceiveResponse:(BasicResponseModel*) basicResponse{
    CFAbsoluteTime timeC = CFAbsoluteTimeGetCurrent();
    WeatherBoxResponseModel *response = (WeatherBoxResponseModel*) basicResponse;
    
    NSMutableArray *annotations = [NSMutableArray array];
    for (WeatherBoxModel *model in response.list) {
        if ([[WeatherCurrentCache sharedInstance] addWeatherBoxModel:model]){
            WeatherBoxAnnotation *annotation = [[[WeatherBoxAnnotation alloc] init] autorelease];
            [annotation setCoordinate:CLLocationCoordinate2DMake(model.lat, model.lon)];
            annotation.weatherBoxModel = model;
            [annotations addObject:annotation];
        }
    }
    
    [self.mapView addAnnotations:annotations];
    NSLog(@"time = %f", CFAbsoluteTimeGetCurrent()-timeC);
    
}

@end
