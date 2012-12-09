//
//  WeatherConditionModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherConditionModel.h"


@implementation WeatherConditionModel
@synthesize weatherType = _weatherType;
- (NSString *) urlIcon:(NSString*) code{
    NSString* url = [NSString stringWithFormat:@"%@%@", API_WEATHER_CONDITION_IMG_URL, code];
    return url;
}
@end
