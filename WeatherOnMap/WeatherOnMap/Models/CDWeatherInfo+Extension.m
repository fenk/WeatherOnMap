//
//  CDWeatherInfo+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherInfo+Extension.h"
#import "CDWeatherMain+Extension.h"
#import "CDWeatherWind+Extension.h"
#import "CDWeatherCondition+Extension.h"
#import "CDWeatherCloud+Extension.h"

@implementation CDWeatherInfo (Extension)
+ (NSArray*) fetchWeathersFromBBox:(BBox) bbox{
    NSString *predicate = [NSString stringWithFormat:@"(lat < %f AND lon > %f) AND (lat > %f AND lon < %f)",bbox.leftTop.latitude, bbox.leftTop.longitude, bbox.rightBottom.latitude, bbox.rightBottom.longitude ];
    NSArray *objects = [CDWeatherInfo fetchObjectsOfClass:[self class] sortedBy:nil filterString:predicate];
    return objects;
}

+ (id) createObjectWithDictionary:(NSDictionary*) dictionary{
    
    CDWeatherInfo *weatherInfo = (CDWeatherInfo*)[self createNewObject];
    [weatherInfo fillWithDictionary:dictionary];
    return weatherInfo;
}

- (void)fillWithDictionary:(NSDictionary *)dictionary{
    double lat = [[[dictionary valueForKey:@"coord"]valueForKey:@"lat"] doubleValue];
    double lon = [[[dictionary valueForKey:@"coord"]valueForKey:@"lon"] doubleValue];
    self.lat = lat;
    self.lon = lon;
    self.distance = [[dictionary valueForKey:@"distance"] doubleValue];
    self.dt = [[dictionary valueForKey:@"dt"] longLongValue];
    self.dtTxt = [dictionary valueForKey:@"dt_txt"];
    self.identificator = [[dictionary valueForKey:@"id"] longLongValue];
    self.name = [dictionary valueForKey:@"name"];

    if (self.cloud == nil) {
        self.cloud = [CDWeatherCloud createObjectWithDictionary:[dictionary valueForKey:@"clouds"]];
    }else{
        [self.cloud fillWithDictionary:dictionary];
    }
    if (self.main == nil) {
        self.main = [CDWeatherMain createObjectWithDictionary:[dictionary valueForKey:@"main"]];
    }else{
        [self.main fillWithDictionary:dictionary];
    }
    if (self.condition == nil) {
        self.condition = [CDWeatherCondition createObjectWithDictionary:[dictionary valueForKey:@"weather"]];
    }else{
        [self.condition fillWithDictionary:dictionary];
    }
    if (self.wind == nil) {
        self.wind = [CDWeatherWind createObjectWithDictionary:[dictionary valueForKey:@"wind"]];
    }else{
        [self.wind fillWithDictionary:dictionary];
    }
}
@end
