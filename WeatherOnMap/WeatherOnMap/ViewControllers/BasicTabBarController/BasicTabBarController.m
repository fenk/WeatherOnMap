//
//  BasicTabBarController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicTabBarController.h"

@interface BasicTabBarController ()

@end

@implementation BasicTabBarController


- (id)init
{
    self = [super init];
    if (self) {
        
        self.delegate = self;
        
        CityViewController *cityViewController = [[[CityViewController alloc] init] autorelease];
        UINavigationController *cityNav = [[[UINavigationController alloc] initWithRootViewController: cityViewController] autorelease];
        cityNav.tabBarItem.title = @"City";
        
        LiveViewController *liveViewController = [[[LiveViewController alloc] init] autorelease];
        UINavigationController *liveNav = [[[UINavigationController alloc] initWithRootViewController:liveViewController] autorelease];
        liveNav.tabBarItem.title = @"Live";
        
        LiveBoxViewController *liveBoxController = [[[LiveBoxViewController alloc] init] autorelease];
        UINavigationController *liveboxNav = [[[UINavigationController alloc] initWithRootViewController:liveBoxController] autorelease];
        liveboxNav.tabBarItem.title = @"Live Box";

        ForecastViewController *forecastViewController = [[[ForecastViewController alloc] init] autorelease];
        UINavigationController *forecastNav = [[[UINavigationController alloc] initWithRootViewController:forecastViewController] autorelease];
        forecastNav.tabBarItem.title = @"Forecast";

        [self setViewControllers:[NSArray arrayWithObjects:cityNav,liveNav, liveboxNav,forecastNav,nil]];

        
    }
    return self;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    [[WeatherOnMapService sharedInstance] cancelAllRequest];
}

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
