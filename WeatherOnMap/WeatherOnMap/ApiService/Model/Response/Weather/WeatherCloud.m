//
//  WeatherCloud.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherCloud.h"

@implementation WeatherCloud
- (id)initWithDictionary:(NSDictionary *)params{
    self = [super init];
    if (self) {
        if (params) {
            if ([params valueForKey:@"all"]) self.all = [[params valueForKey:@"all"] integerValue];
            if ([params valueForKey:@"high"]) self.high = [[params valueForKey:@"high"] integerValue];
            if ([params valueForKey:@"low"]) self.low = [[params valueForKey:@"low"] integerValue];
            if ([params valueForKey:@"middle"]) self.middle = [[params valueForKey:@"middle"] integerValue];

            if ([params valueForKey:@"distance"]) self.distance = [[params valueForKey:@"distance"] doubleValue];
            self.condition = [params valueForKey:@"condition"];
            self.cumulus = [params valueForKey:@"cumulus"];
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    WeatherCloud *copy = [[WeatherCloud alloc] init];
    copy.all = self.all;
    copy.high = self.high;
    copy.low = self.low;
    copy.middle = self.middle;
    copy.distance = self.distance;
    copy.condition = self.condition;
    copy.cumulus = self.cumulus;
    return copy;
}
- (NSString*) description{
    return [NSString stringWithFormat:@"all = %d  distance = %f  condition = %@  cumulus = %@", self.all, self.distance, self.condition, self.cumulus];
}
@end
