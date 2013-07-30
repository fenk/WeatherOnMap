//
//  WeatherCloud.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CDObject+Extension.h"

@interface CDWeatherCloud : CDObject

@property (nonatomic) int64_t all;
@property (nonatomic) int64_t high;
@property (nonatomic) int64_t low;
@property (nonatomic) int64_t middle;
@property (nonatomic) double distance;
@property (nonatomic, retain) NSString * condition;
@property (nonatomic, retain) NSString * cumulus;

@end
