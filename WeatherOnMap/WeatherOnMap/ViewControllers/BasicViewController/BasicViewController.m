//
//  BasicViewController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicViewController.h"
#import "LocationService.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

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
    
    UIButton *localizeMe = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [localizeMe setTitle:@"Localize Me" forState:UIControlStateNormal];
    [localizeMe setFrame:CGRectMake(20, 100, 280, 40)];
    [localizeMe addTarget:self action:@selector(localizeMeNow:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:localizeMe];
    

    
}

- (void) localizeMeNow:(id) sender{
    
    CLLocationManager *manager = [[CLLocationManager alloc] init];
    
    [LocationService getUserLocationManager:manager WithCompletion:^(CLLocation *newLocation, CLLocation *oldLocation) {
        WeatherRequestModel *weatherRequest = [[WeatherRequestModel alloc] init];
        weatherRequest.latitude = newLocation.coordinate.latitude;
        weatherRequest.longitude = newLocation.coordinate.longitude;
        weatherRequest.resultCountExpected = 100;
        [[WeatherOnMapService sharedInstance] getWeather:weatherRequest withCaller:self];
        [weatherRequest release];
        [manager stopUpdatingLocation];
    }];
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
    
    WeatherResponseModel *response = (WeatherResponseModel*) basicResponse;
    
    DebugLog(@"%@", response.list);
    
}
- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}

@end
