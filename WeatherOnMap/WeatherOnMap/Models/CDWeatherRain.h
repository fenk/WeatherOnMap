//
//  CDWeatherRain.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CDObject+Extension.h"


@interface CDWeatherRain : CDObject
@property(nonatomic, assign) double one_hour;
@property(nonatomic, assign) double three_hours;
@property(nonatomic, assign) double six_hours;
@property(nonatomic, assign) double twelve_hours;
@property(nonatomic, assign) double day;
@property(nonatomic, assign) double raw;
@end
