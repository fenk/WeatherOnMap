//
//  CDWeatherRain+Extension.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherRain.h"

@interface CDWeatherRain (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary;
- (void) fillWithDictionary:(NSDictionary*) dictionary;
@end
