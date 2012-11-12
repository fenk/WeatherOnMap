//
//  WeatherOnMapService.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 10/25/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherOnMapService.h"

@implementation WeatherOnMapService

static WeatherOnMapService *instance = nil;

+ (WeatherOnMapService*) sharedInstance{
    
    if (instance == nil) {
        instance = [[WeatherOnMapService alloc] init];
    }
    return instance;

}

@end
