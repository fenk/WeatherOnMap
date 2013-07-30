//
//  WeatherWind.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/10/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherWind.h"

@implementation WeatherWind

- (id)initWithDictionary:(NSDictionary *)params{
    self = [super init];
    if (self) {
        self.degree = [[params valueForKey:@"deg"] integerValue];
        self.speed = [[params valueForKey:@"speed"] doubleValue];
        self.gust = [[params valueForKey:@"gust"] doubleValue];
        self.var_begin = [[params valueForKey:@"var_begin"] integerValue];
        self.var_end = [[params valueForKey:@"var_end"] integerValue];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    WeatherWind *copy = [[WeatherWind alloc] init];
    copy.degree = self.degree;
    copy.gust = self.gust;
    copy.speed = self.speed;
    copy.var_begin = self.var_begin;
    copy.var_end = self.var_end;
    return copy;
}
- (NSString*) description{
    return [NSString stringWithFormat:@"degree = %d  speed = %f", self.degree, self.speed];
}
@end
