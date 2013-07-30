//
//  BasicAnnotationView.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicAnnotationView.h"

@implementation BasicAnnotationView
- (CLLocationCoordinate2D)coordinate {
    return _coordinate;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    _coordinate = newCoordinate;
}
@end
