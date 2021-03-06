//
//  CDWeatherInfo+Extension.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherInfo.h"
#import "BasicRequestModel.h"
#import "CDObject+Extension.h"


@interface CDWeatherInfo (Extension)
+ (NSArray*) fetchWeathersFromBBox:(BBox) bbox;
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary;
- (void) fillWithDictionary:(NSDictionary*) dictionary;

@end
