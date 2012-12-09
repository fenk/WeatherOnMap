//
//  WeatherModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherConditionModel.h"
@interface WeatherModel : NSObject
//mandatory
@property(nonatomic, assign) int identificator;
@property(nonatomic, assign) long long timeDataReceiving;
@property(nonatomic, assign) double latitude;
@property(nonatomic, assign) double longitude;
@property(nonatomic, retain) NSString *cityName;
@property(nonatomic, assign) double temperatureKelvin;
@property(nonatomic, assign) int humidity;
//optional
@property(nonatomic, assign) double minTemperature;
@property(nonatomic, assign) double maxTemperature;
//mandatory
@property(nonatomic, assign) double pressure;
@property(nonatomic, assign) double windSpeed;
@property(nonatomic, assign) double windDirection;
@property(nonatomic, assign) double cloudiness;
//optional
@property(nonatomic, retain) WeatherConditionModel *weatherCondition;
@property(nonatomic, assign) double rain3hours;
@property(nonatomic, assign) double snow3hours;

@end
