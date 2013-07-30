//
//  SearchCityView.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 1/2/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "BasicViewController.h"

@interface SearchCityView : BasicViewController<WeatherOnMapServiceDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITextField *findCityTextField;
@property (nonatomic, retain) UIButton *findButton;
@property (nonatomic, retain) UITableView *searchTableView;
@end
