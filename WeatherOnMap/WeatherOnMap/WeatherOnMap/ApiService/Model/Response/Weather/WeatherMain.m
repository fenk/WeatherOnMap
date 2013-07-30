//
//  WeatherMain.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/10/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherMain.h"

@implementation WeatherMain

- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        self.humidity = [[params valueForKey:@"humidity"] integerValue];
        self.pressure = [[params valueForKey:@"pressure"] integerValue];
        self.temp = [[params valueForKey:@"temp"] doubleValue];
        self.temp_max = [[params valueForKey:@"temp_max"] doubleValue];
        self.temp_min = [[params valueForKey:@"temp_min"] doubleValue];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    WeatherMain *copy = [[WeatherMain alloc] init];
    copy.humidity = self.humidity;
    copy.pressure = self.pressure;
    copy.temp = self.temp;
    copy.temp_max = self.temp_max;
    copy.temp_min = self.temp_min;
    return copy;
}

- (NSString*) description{
    return [NSString stringWithFormat:@"humidity = %d  pressure = %d  temp = %f", self.humidity, self.pressure, self.temp];
}
@end
