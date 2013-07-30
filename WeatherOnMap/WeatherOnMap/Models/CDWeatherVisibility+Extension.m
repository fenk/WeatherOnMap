//
//  CDWeatherVisibility+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherVisibility+Extension.h"

@implementation CDWeatherVisibility (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary{
    CDWeatherVisibility *weatherVisibility = (CDWeatherVisibility*)[self createNewObject];
    [weatherVisibility fillWithDictionary:dictionary];
    return weatherVisibility;
}

- (void) fillWithDictionary:(NSDictionary*) dictionary{
    if (dictionary) {
        self.prefix = [dictionary valueForKey:@"prefix"];
        self.distance = [[dictionary valueForKey:@"distance"] doubleValue];
    }
}
@end
