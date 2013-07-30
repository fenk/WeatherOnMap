//
//  CDWeatherWind+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherWind+Extension.h"
#import "CDObject+Extension.h"

@implementation CDWeatherWind (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary{
    CDWeatherWind *weatherInfo = (CDWeatherWind*)[self createNewObject];
    [weatherInfo fillWithDictionary:dictionary];
    return weatherInfo;
}

- (void) fillWithDictionary:(NSDictionary*) dictionary{
    self.degree = [[dictionary valueForKey:@"deg"] integerValue];
    self.speed = [[dictionary valueForKey:@"speed"] doubleValue];
    self.gust = [[dictionary valueForKey:@"gust"] doubleValue];
    self.var_begin = [[dictionary valueForKey:@"var_begin"] integerValue];
    self.var_end = [[dictionary valueForKey:@"var_end"] integerValue];
}

@end
