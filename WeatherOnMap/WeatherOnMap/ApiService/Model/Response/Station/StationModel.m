//
//  StationModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "StationModel.h"

@implementation StationModel
@synthesize distance = _distance;
@synthesize cloud = _cloud;
@synthesize rain = _rain;
@synthesize type = _type;
@synthesize range = _range;
@synthesize lat = _lat;
@synthesize lon = _lon;
@synthesize dt = _dt;
@synthesize identificator = _identificator;
@synthesize main = _main;
@synthesize name = _name;
@synthesize stationCondition = _stationCondition;
@synthesize weatherWind = _weatherWind;

- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        double lat = [[[params valueForKey:@"coord"]valueForKey:@"lat"] doubleValue];
        double lon = [[[params valueForKey:@"coord"]valueForKey:@"lon"] doubleValue];
        self.lat = lat;
        self.lon = lon;
        self.cloud = [[WeatherCloud alloc] initWithDictionary:[[params valueForKey:@"clouds"] objectAtIndex:0]];
        self.type = [[params valueForKey:@"type"] integerValue];
        self.range = [[params valueForKey:@"range"] integerValue];
        self.distance = [[params valueForKey:@"distance"] doubleValue];
        self.dt = [[params valueForKey:@"dt"] longLongValue];
        self.identificator = [[params valueForKey:@"id"] longLongValue];
        self.main = [[[WeatherMain alloc] initWithDictionary:[params valueForKey:@"main"]] autorelease];
        self.name = [params valueForKey:@"name"];
        self.stationCondition = [[[StationConditionModel alloc] initWithDictionary:[params valueForKey:@"weather"]] autorelease];
        self.weatherWind = [[WeatherWind alloc] initWithDictionary:[params valueForKey:@"wind"]];
        self.visibility = [[WeatherVisibility alloc] initWithDictionary:[params valueForKey:@"visibility"]];
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@" name = %@, weather %@, condition %@, wind %@  rain %@", self.name, self.main, self.stationCondition, self.weatherWind, self.rain];
}
@end
