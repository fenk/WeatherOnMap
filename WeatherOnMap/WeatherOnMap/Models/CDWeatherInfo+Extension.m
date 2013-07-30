//
//  CDWeatherInfo+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherInfo+Extension.h"

@implementation CDWeatherInfo (Extension)
+ (NSArray*) fetchWeathersFromBBox:(BBox) bbox{
    NSString *predicate = [NSString stringWithFormat:@"(lat < %f AND lon > %f) AND (lat > %f AND lon < %f)",bbox.leftTop.latitude, bbox.leftTop.longitude, bbox.rightBottom.latitude, bbox.rightBottom.longitude ];
    NSArray *objects = [CDWeatherInfo fetchObjectsOfClass:[self class] sortedBy:nil filterString:predicate];
    return objects;
}
@end
