//
//  WeatherOnMapService.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 10/25/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

/* 
 
 This service is responsible for fetch appropriate information about weather based on the
 openweathermap.com API 
 
 */


#import <Foundation/Foundation.h>

@interface WeatherOnMapService : NSObject

+ (WeatherOnMapService*) sharedInstance;

@end
