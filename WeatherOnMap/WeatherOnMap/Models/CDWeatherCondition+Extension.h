//
//  CDWeatherCondition+Extension.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherCondition.h"
#import "CDObject+Extension.h"

@interface CDWeatherCondition (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary;
- (void) fillWithDictionary:(NSDictionary*) dictionary;

@end
