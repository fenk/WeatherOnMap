//
//  CityModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

- (id)initWithDictionary:(NSDictionary *)params{
    self = [super initWithDictionary:params];
    if (self) {
//        self.stationModel = [[StationModel alloc] initForCityWithDictionary:params];
        self.url = [params valueForKey:@"url"];
        self.country = [[params valueForKey:@"sys"] valueForKey:@"country"];
        self.population = [[[params valueForKey:@"sys"] valueForKey:@"population"] longLongValue];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}
@end
