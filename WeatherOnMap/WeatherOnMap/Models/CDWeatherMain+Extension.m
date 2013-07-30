//
//  CDWeatherMain+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherMain+Extension.h"

@implementation CDWeatherMain (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary{
    
    CDWeatherMain *weatherMain = (CDWeatherMain*)[self createNewObject];
    [weatherMain fillWithDictionary:dictionary];

}

- (void) fillWithDictionary:(NSDictionary*) dictionary{
    self.humidity = [[dictionary valueForKey:@"humidity"] integerValue];
    self.pressure = [[dictionary valueForKey:@"pressure"] integerValue];
    self.temp = [[dictionary valueForKey:@"temp"] doubleValue];
    self.temp_max = [[dictionary valueForKey:@"temp_max"] doubleValue];
    self.temp_min = [[dictionary valueForKey:@"temp_min"] doubleValue];
}

@end
