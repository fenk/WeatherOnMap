//
//  CDWeatherCloud+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherCloud+Extension.h"

@implementation CDWeatherCloud (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary{
    CDWeatherCloud *weatherCloud = (CDWeatherCloud*)[self createNewObject];
    [weatherCloud fillWithDictionary:dictionary];
    return weatherCloud;
}

- (void) fillWithDictionary:(NSDictionary*) dictionary{
    if (dictionary) {
        if ([dictionary valueForKey:@"all"]) self.all = [[dictionary valueForKey:@"all"] integerValue];
        if ([dictionary valueForKey:@"high"]) self.high = [[dictionary valueForKey:@"high"] integerValue];
        if ([dictionary valueForKey:@"low"]) self.low = [[dictionary valueForKey:@"low"] integerValue];
        if ([dictionary valueForKey:@"middle"]) self.middle = [[dictionary valueForKey:@"middle"] integerValue];
        
        if ([dictionary valueForKey:@"distance"]) self.distance = [[dictionary valueForKey:@"distance"] doubleValue];
        self.condition = [dictionary valueForKey:@"condition"];
        self.cumulus = [dictionary valueForKey:@"cumulus"];
    }
}
@end
