//
//  CDWeatherRain+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherRain+Extension.h"

@implementation CDWeatherRain (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary{
    CDWeatherRain *weatherRain = (CDWeatherRain*)[self createNewObject];
    [weatherRain fillWithDictionary:dictionary];
    return weatherRain;
}

- (void) fillWithDictionary:(NSDictionary*) dictionary{
    if (dictionary) {
        self.one_hour = [[dictionary valueForKey:@"1h"] doubleValue];
        self.three_hours = [[dictionary valueForKey:@"3h"] doubleValue];
        self.six_hours = [[dictionary valueForKey:@"6h"] doubleValue];
        self.twelve_hours = [[dictionary valueForKey:@"12h"] doubleValue];
        self.day = [[dictionary valueForKey:@"24h"] doubleValue];
        self.raw = [[dictionary valueForKey:@"raw"] doubleValue];
    }
}
@end
