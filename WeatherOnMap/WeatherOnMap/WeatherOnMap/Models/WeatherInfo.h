//
//  WeatherInfo.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WeatherCloud, WeatherCondition, WeatherMain, WeatherWind;

@interface WeatherInfo : NSManagedObject

@property (nonatomic) double distance;
@property (nonatomic) double lat;
@property (nonatomic) double lon;
@property (nonatomic) int64_t dt;
@property (nonatomic, retain) NSString * dtTxt;
@property (nonatomic) int64_t identificator;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) WeatherCloud *cloud;
@property (nonatomic, retain) WeatherMain *main;
@property (nonatomic, retain) WeatherCondition *condition;
@property (nonatomic, retain) WeatherWind *wind;

@end
