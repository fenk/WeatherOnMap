//
//  SearchCityView.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 1/2/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "BasicViewController.h"
@class SearchCityViewController;
@protocol WeatherOnMapServiceDelegate;


@protocol SearchCityViewControllerDelegate <NSObject>

- (void) searchCityViewController:(SearchCityViewController*) viewController didDismissWithData:(id) data;

@end

@interface SearchCityViewController : BasicViewController<WeatherOnMapServiceDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITextField *findCityTextField;
@property (nonatomic, retain) UITableView *searchTableView;
@property (nonatomic, assign) id<SearchCityViewControllerDelegate> delegate;
@end
