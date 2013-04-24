//
//  CityViewController.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController ()

@end

@implementation CityViewController

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
    [self setTitle:@"Weather in Cities"];
    self.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc]initWithTitle:@"Add City" style:UIBarButtonItemStylePlain target:self action:@selector(searchCity:)]autorelease];
    
}

- (void) searchCity:(id) sender{
    SearchCityViewController *searchCityViewController = [[[SearchCityViewController alloc] init] autorelease];
    searchCityViewController.delegate = self;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:searchCityViewController];
    [self presentModalViewController:navigationController animated:YES];
}


- (void)searchCityViewController:(SearchCityViewController *)viewController didDismissWithData:(id)data{
    [[[UIAlertView alloc] initWithTitle:@"City Model" message:[NSString stringWithFormat:@"%@", data] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
