//
//  WeatherRain.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherRain : NSObject<NSCopying>
@property(nonatomic, assign) double oneHour;
@property(nonatomic, assign) double threeHours;
@property(nonatomic, assign) double sixHours;
@property(nonatomic, assign) double twelveHours;
@property(nonatomic, assign) double day;
@property(nonatomic, assign) double raw;
- (id)initWithDictionary:(NSDictionary *)params;
@end
