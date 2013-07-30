//
//  CDWeatherCondition+Extension.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDWeatherCondition+Extension.h"

@implementation CDWeatherCondition (Extension)
+ (id) createObjectWithDictionary:(NSDictionary*) dictionary{
    CDWeatherCondition *weatherInfo = (CDWeatherCondition*)[self createNewObject];
    [weatherInfo fillWithDictionary:dictionary];
    return weatherInfo;
}

- (void) fillWithDictionary:(NSDictionary*) dictionary{
    
    self.description_weather = [[dictionary valueForKey:@"description"] objectAtIndex:0];
    NSString *url = [self urlIcon:[[dictionary valueForKey:@"icon"] objectAtIndex:0]];
    self.icon = url;
    self.main = [dictionary valueForKey:@"main"];

}

- (NSString *) urlIcon:(NSString*) code{
    NSString* url = [NSString stringWithFormat:@"%@%@.png", API_WEATHER_CONDITION_IMG_URL, code];
    return url;
}

@end
