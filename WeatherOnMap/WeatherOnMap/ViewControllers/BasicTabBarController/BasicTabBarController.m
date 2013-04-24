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
        self.tabBar.tintColor = [ColorDefined tabbarColor];
        CityViewController *cityViewController = [[[CityViewController alloc] init] autorelease];
        cityViewController.title = @"Weather in Cities";
        UINavigationController *cityNav = [[[UINavigationController alloc] initWithRootViewController: cityViewController] autorelease];
        cityNav.tabBarItem.title = @"Weather in Cities";
        cityNav.tabBarItem.image = [UIImage imageNamed:@"icon_city.png"];
        
        LiveViewController *liveViewController = [[[LiveViewController alloc] init] autorelease];
        liveViewController.title =  @"Live Weather";

        UINavigationController *liveNav = [[[UINavigationController alloc] initWithRootViewController:liveViewController] autorelease];
        liveNav.tabBarItem.title = @"Live Weather";
        liveNav.tabBarItem.image = [UIImage imageNamed:@"icon_live.png"];

//        LiveBoxViewController *liveBoxController = [[[LiveBoxViewController alloc] init] autorelease];
//        UINavigationController *liveboxNav = [[[UINavigationController alloc] initWithRootViewController:liveBoxController] autorelease];
//        liveboxNav.tabBarItem.title = @"Live Box";
//
//        ForecastViewController *forecastViewController = [[[ForecastViewController alloc] init] autorelease];
//        UINavigationController *forecastNav = [[[UINavigationController alloc] initWithRootViewController:forecastViewController] autorelease];
//        forecastNav.tabBarItem.title = @"Forecast";

        [self setViewControllers:[NSArray arrayWithObjects:cityNav,liveNav,nil]];

        
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
