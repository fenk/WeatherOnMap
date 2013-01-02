//
//  WeatherBoxModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherBoxModel.h"
/*
 "cloud": "99",
 "datatype": "city",
 "dt": "1355876406",
 "humidity": "93.70",
 "id": "2760910",
 "lat": "46.84",
 "lng": "14.84",
 "name": "Wolfsberg",
 "prcp": "0",
 "pressure": "923",
 "prsp_type": "1",
 "rang": "25610",
 "temp": "273.62",
 "temp_max": "274",
 "temp_min": "273",
 "type": "0",
 "wind_deg": "-2",
 "wind_ms": "1"
 */
@implementation WeatherBoxModel
- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        self.cloud = [[params valueForKey:@"cloud"] integerValue];
        self.datatype = [params valueForKey:@"datatype"];
        self.dt = [[params valueForKey:@"dt"] longLongValue];
        self.humidity = [[params valueForKey:@"humidity"] doubleValue];
        self.identificator = [[params valueForKey:@"id"] longLongValue];
        self.lat = [[params valueForKey:@"lat"] doubleValue];
        self.lon = [[params valueForKey:@"lng"] doubleValue];
        self.name = [params valueForKey:@"name"];
        self.prcp = [[params valueForKey:@"prcp"] integerValue];
        self.pressure = [[params valueForKey:@"pressure"] integerValue];
        self.prsp_type = [[params valueForKey:@"prsp_type"] integerValue];
        self.range = [[params valueForKey:@"range"] integerValue];
        self.temp = [[params valueForKey:@"temp"] doubleValue];
        self.temp_min = [[params valueForKey:@"temp_min"] doubleValue];
        self.temp_max = [[params valueForKey:@"temp_max"] doubleValue];
        self.type = [[params valueForKey:@"type"] integerValue];
        self.wind_deg = [[params valueForKey:@"wind_deg"] integerValue];
        self.wind_ms = [[params valueForKey:@"wind_ms"] integerValue];
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone{
    WeatherBoxModel *copy = [[WeatherBoxModel alloc] init];
    copy.cloud = self.cloud;
    copy.datatype = self.datatype;
    copy.dt = self.dt;
    copy.humidity = self.humidity;
    copy.identificator = self.identificator;
    copy.lat = self.lat;
    copy.lon = self.lon;
    copy.name = self.name;
    copy.prcp = self.prcp;
    copy.prsp_type = self.prsp_type;
    copy.range = self.range;
    copy.temp = self.temp;
    copy.temp_max = self.temp_max;
    copy.temp_min = self.temp_min;
    copy.type = self.type;
    copy.wind_deg = self.wind_deg;
    copy.wind_ms = self.wind_ms;
    return copy;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"name = %@,cloud = %d, humidity = %f, lat = %f, lon = %f", self.name, self.cloud, self.humidity, self.lat, self.lon];
}
@end
