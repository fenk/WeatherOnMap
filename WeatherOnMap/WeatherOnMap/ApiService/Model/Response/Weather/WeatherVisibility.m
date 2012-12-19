//
//  WeatherVisibility.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherVisibility.h"

@implementation WeatherVisibility
- (id)initWithDictionary:(NSDictionary *)params{
    self = [super init];
    if (self) {
        self.prefix = [params valueForKey:@"prefix"];
        self.distance = [[params valueForKey:@"distance"] doubleValue];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    WeatherVisibility *copy = [[WeatherVisibility alloc] init];
    copy.prefix = [self.prefix copy];
    copy.distance = self.distance;
    return copy;
}
- (NSString*) description{
    return [NSString stringWithFormat:@"prefix = %@  distance = %f", self.prefix, self.distance];
}
@end
