//
//  CDStationInfo.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CDObject+Extension.h"

@class CDWeatherCloud, CDWeatherCondition, CDWeatherMain, CDWeatherRain, CDWeatherVisibility, CDWeatherWind;

@interface CDStationInfo : CDObject

@property (nonatomic) double distance;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic) int64_t dt;
@property (nonatomic) int64_t identificator;
@property (nonatomic) int64_t range;
@property (nonatomic) int64_t type;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) CDWeatherCloud *cloud;
@property (nonatomic, retain) CDWeatherMain *main;
@property (nonatomic, retain) CDWeatherCondition *condition;
@property (nonatomic, retain) CDWeatherWind *wind;
@property (nonatomic, retain) CDWeatherRain *rain;
@property (nonatomic, retain) CDWeatherVisibility *visibility;

@end
