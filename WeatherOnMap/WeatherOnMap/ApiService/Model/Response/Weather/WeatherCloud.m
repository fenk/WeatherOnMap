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
    copy.distance = self.distance;
    copy.condition = [self.condition copy];
    copy.cumulus = [self.cumulus copy];
    return copy;
}
- (NSString*) description{
    return [NSString stringWithFormat:@"all = %d  distance = %f  condition = %@  cumulus = %@", self.all, self.distance, self.condition, self.cumulus];
}
@end
