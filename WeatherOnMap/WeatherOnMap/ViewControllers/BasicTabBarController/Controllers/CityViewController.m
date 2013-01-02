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
    self.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(searchCity:)]autorelease];
    
}

- (void) searchCity:(id) sender{
    SearchCityView *searchCityView = [[[SearchCityView alloc] init] autorelease];
    searchCityView.delegate = self;
    [searchCityView showInView:self.view];
}

- (void) findCityAction:(id) sender{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didFilledDataChanged:(ModalFadingView*) modalSelectionView withData:(id) data{
    
    [[WeatherOnMapService sharedInstance] findCityByName:(NSString*)data withCaller:self];

}
- (void) didFilledDataCancelled:(ModalFadingView*) modalSelectionView{
    

}

- (void) didReceiveError:(NSError*) error{
    DebugLog(@"%@", error);
}
- (void) didReceiveResponse:(BasicResponseModel*) basicResponse{
    
    
    
}

@end
