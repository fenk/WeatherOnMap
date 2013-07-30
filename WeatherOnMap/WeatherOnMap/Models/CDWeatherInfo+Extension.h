//
//  CDWeatherInfo+Extension.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherInfo.h"
#import "BasicRequestModel.h"
@interface CDWeatherInfo (Extension)
+ (NSArray*) fetchWeathersFromBBox:(BBox) bbox;
@end
