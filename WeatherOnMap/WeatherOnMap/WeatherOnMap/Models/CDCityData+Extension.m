//
//  CDCityData+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/31/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDCityData+Extension.h"

@implementation CDCityData (Extension)
+ (id) createObjectWithDictionary:(NSArray*) array{
    CDCityData *cityData = (CDCityData*)[self createNewObject];
    [cityData fillWithArray:array];
    return cityData;
}
- (void) fillWithArray:(NSArray*) array{
    self.country = [array objectAtIndex:0];
    self.region = [array objectAtIndex:1];
    self.name = [array objectAtIndex:2];
    self.postal_code = [array objectAtIndex:3];
    self.lat = [[array objectAtIndex:4] doubleValue];
    self.lon = [[array objectAtIndex:5] doubleValue];
    self.area_code = [array objectAtIndex:7];
}
@end
