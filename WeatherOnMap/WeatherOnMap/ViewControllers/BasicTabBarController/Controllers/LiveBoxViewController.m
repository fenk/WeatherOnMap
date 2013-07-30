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
#import "CDWeatherCondition.h"
#import "CDWeatherInfo.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"

@interface LiveBoxViewController ()
@property(nonatomic, retain) MKMapView *mapView;
@property(nonatomic, assign) BOOL autoReload;
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

    self.autoReload = YES;
    

}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    WeatherRequestModel *weatherRequest = [[WeatherRequestModel alloc] init];
    weatherRequest.bbox = BBoxMake(CLLocationCoordinate2DMake(90,-180.0), CLLocationCoordinate2DMake(-90, 180));
    [[WeatherOnMapService sharedInstance] getWeatherByBBox:weatherRequest withCaller:self];
    [weatherRequest release];
    
    
    [[AppDelegate sharedDelegate] readCSV];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark MapView delegates
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    
}

- (void) reloadAnnotation:(BOOL) force{
    CLLocationCoordinate2D leftTop = [self.mapView convertPoint:CGPointMake(self.mapView.frame.origin.x, self.mapView.frame.origin.y) toCoordinateFromView:self.view];
    CLLocationCoordinate2D rightBottom = [self.mapView convertPoint:CGPointMake(self.mapView.frame.origin.x+self.mapView.frame.size.width, self.mapView.frame.origin.y+self.mapView.frame.size.height) toCoordinateFromView:self.view];
    BBox bbox = BBoxMake(leftTop, rightBottom);
    
    WeatherRequestModel *weatherRequest = [[WeatherRequestModel alloc] init];
    weatherRequest.bbox = bbox;
    weatherRequest.forceReload = force;
    weatherRequest.cluster = [NSNumber numberWithBool:YES];
    
    [[WeatherOnMapService sharedInstance] getWeatherByBBox:weatherRequest withCaller:self];
    [weatherRequest release];

}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    if (self.autoReload) {
        [self reloadAnnotation:NO];
    }
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
    UIImageView *img = [[UIImageView alloc] init];
    [img setImageWithURL:[NSURL URLWithString:weatherAnnotation.weatherInfo.condition.icon]];
    
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
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Details" message:annotation.weatherInfo.description delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil];
    [alert show
     ];
    [alert release];
}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}

- (void) didReceiveResponse:(BasicResponseModel*) basicResponse fromCoreData:(BOOL)coreData{
    if (coreData == NO || self.mapView.annotations.count == 0) {
        CFAbsoluteTime timeC = CFAbsoluteTimeGetCurrent();
        WeatherResponseModel *response = (WeatherResponseModel*) basicResponse;
        DebugLog(@"%d", response.list.count);
        
        time_t unixTime = (time_t) [[NSDate date] timeIntervalSince1970];
        
        
        NSMutableArray *annotations = [NSMutableArray array];
        for (CDWeatherInfo *model in response.list) {
            NSLog(@"%ld minutes",(long)(unixTime - model.dt)/60);
            WeatherAnnotation *annotation = [[[WeatherAnnotation alloc] init] autorelease];
            [annotation setCoordinate:CLLocationCoordinate2DMake(model.lat, model.lon)];
            annotation.weatherInfo = model;
            [annotations addObject:annotation];
            
        }
        
        [self.mapView addAnnotations:annotations];
        NSLog(@"time = %f", CFAbsoluteTimeGetCurrent()-timeC);
    }
   
    
}


#pragma  mark show Settings

- (void) showSettings:(id) sender{
    NSString *autoReloadString = nil;
    if (self.autoReload == NO) {
        autoReloadString = @"Enable Autoreload Weather";
    }else{
        autoReloadString = @"Disable Autoreload Weather";

    }
    NSArray *options = @[@"Search City", @"Show found cities", @"Force Reload", @"Clear all annotations", autoReloadString];
    RNGridMenu *av = [[RNGridMenu alloc] initWithTitles:options];
    [av setItemSize:CGSizeMake(200, 200)];
    [av setItemFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:16.0 ]];
    av.delegate = self;
    [av setMenuStyle:RNGridMenuStyleGrid];
    [av setBounces:YES];
    [av showInViewController:self center:self.view.center];
}

- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex{
    if (itemIndex == 0) {

    }
    if (itemIndex == 1) {
        
    }
    if (itemIndex == 2) {
        [self reloadAnnotation:YES];
    }
    if (itemIndex == 3) {
        NSInteger toRemoveCount = self.mapView.annotations.count;
        NSMutableArray *toRemove = [NSMutableArray arrayWithCapacity:toRemoveCount];
        for (id annotation in self.mapView.annotations)
            if (annotation != self.mapView.userLocation)
                [toRemove addObject:annotation];
        [self.mapView removeAnnotations:toRemove];
    }
    if (itemIndex == 4) {
        if (self.autoReload) {
            self.autoReload = NO;
        }else{
            self.autoReload = YES;
            [self reloadAnnotation:YES];
        }
    }
}


@end
