//
//  WeatherWind.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CDObject+Extension.h"


@interface CDWeatherWind : CDObject

@property (nonatomic) int64_t degree;
@property (nonatomic) double gust;
@property (nonatomic) double speed;
@property (nonatomic) int64_t var_begin;
@property (nonatomic) int64_t var_end;

@end
