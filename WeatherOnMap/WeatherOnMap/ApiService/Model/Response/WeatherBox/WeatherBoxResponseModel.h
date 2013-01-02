//
//  WeatherBoxResponseModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicResponseModel.h"
#import "WeatherOnMapService.h"

@protocol WeatherOnMapServiceDelegate;

@interface WeatherBoxResponseModel : BasicResponseModel<WeatherOnMapServiceDelegate>

@property(nonatomic, retain) NSMutableDictionary *weathersDictionary;
@end
