//
//  WeatherRain.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherRain.h"

@implementation WeatherRain
- (id)initWithDictionary:(NSDictionary *)params{
    self = [super init];
    if (self) {
        self.oneHour = [[params valueForKey:@"1h"] doubleValue];
        self.threeHours = [[params valueForKey:@"3h"] doubleValue];
        self.sixHours = [[params valueForKey:@"6h"] doubleValue];
        self.twelveHours = [[params valueForKey:@"12h"] doubleValue];
        self.day = [[params valueForKey:@"24h"] doubleValue];
        self.raw = [[params valueForKey:@"raw"] doubleValue];

    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    WeatherRain *copy = [[WeatherRain alloc] init];
    copy.oneHour = self.oneHour;
    copy.threeHours = self.threeHours;
    copy.sixHours = self.sixHours;
    copy.twelveHours = self.twelveHours;
    copy.day = self.day;
    copy.raw = self.raw;
    return copy;
}
- (NSString*) description{
    return [NSString stringWithFormat:@"1h = %f  3h = %f  6h = %f  12h = %f  24h = %f  raw = %f", self.oneHour, self.threeHours, self.sixHours, self.twelveHours, self.day, self.raw];
}
@end
