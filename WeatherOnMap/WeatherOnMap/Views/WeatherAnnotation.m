//
//  WeatherAnnotation.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherAnnotation.h"

@implementation WeatherAnnotation
@synthesize weatherBoxModel = _weatherBoxModel;
- (CLLocationCoordinate2D)coordinate {
    return _coordinate;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    _coordinate = newCoordinate;
}
@end
