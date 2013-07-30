//
//  CityViewController.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicViewController.h"
#import "SearchCityViewController.h"
@interface CityViewController : BasicViewController<WeatherOnMapServiceDelegate,MKMapViewDelegate, SearchCityViewControllerDelegate>

@end