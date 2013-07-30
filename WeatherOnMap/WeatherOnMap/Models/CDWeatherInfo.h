//
//  WeatherInfo.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CDObject+Extension.h"

@class CDWeatherCloud, CDWeatherCondition, CDWeatherMain, CDWeatherWind;

@interface CDWeatherInfo : CDObject

@property (nonatomic) double distance;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic) int64_t dt;
@property (nonatomic, retain) NSString * dtTxt;
@property (nonatomic) int64_t identificator;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) CDWeatherCloud *cloud;
@property (nonatomic, retain) CDWeatherMain *main;
@property (nonatomic, retain) CDWeatherCondition *condition;
@property (nonatomic, retain) CDWeatherWind *wind;

@end
