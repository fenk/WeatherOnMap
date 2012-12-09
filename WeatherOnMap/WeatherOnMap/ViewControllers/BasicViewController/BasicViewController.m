//
//  BasicViewController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicViewController.h"


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
    
    WeatherRequestModel *weatherRequest = [[WeatherRequestModel alloc] init];
    weatherRequest.latitude = 40.6;
    weatherRequest.longitude = 10.5;
    weatherRequest.resultCountExpected = 5;
    [[WeatherOnMapService sharedInstance] getWeather:weatherRequest withCaller:self];
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
    DebugLog(@"%@", basicResponse);
}
- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}

@end
