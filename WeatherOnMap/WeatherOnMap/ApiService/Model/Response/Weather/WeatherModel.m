//
//  WeatherModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel
@synthesize cloudsNumber = _cloudsNumber;
@synthesize distance = _distance;
@synthesize lat = _lat;
@synthesize lon = _lon;
@synthesize dt = _dt;
@synthesize identificator = _identificator;
@synthesize main = _main;
@synthesize name = _name;
@synthesize weatherCondition = _weatherCondition;
@synthesize weatherWind = _weatherWind;

- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        
        self.cloudsNumber = [[[params valueForKey:@"clouds"] valueForKey:@"all"] integerValue];
        double lat = [[[params valueForKey:@"coord"]valueForKey:@"lat"] doubleValue];
        double lon = [[[params valueForKey:@"coord"]valueForKey:@"lat"] doubleValue];
        self.lat = lat;
        self.lon = lon;
        self.distance = [[params valueForKey:@"distance"] doubleValue];
        self.dt = [[params valueForKey:@"dt"] longLongValue];
        self.identificator = [[params valueForKey:@"id"] longLongValue];
        self.main = [[[WeatherMain alloc] initWithDictionary:[params valueForKey:@"main"]] autorelease];
        self.name = [params valueForKey:@"name"];
        self.weatherCondition = [[[WeatherConditionModel alloc] initWithDictionary:[params valueForKey:@"weather"]] autorelease];
        self.weatherWind = [[WeatherWind alloc] initWithDictionary:[params valueForKey:@"wind"]];
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"clouds number = %d,  name = %@, weather %@, condition %@, wind %@",self.cloudsNumber, self.name, self.main, self.weatherCondition, self.weatherWind];
}

@end
