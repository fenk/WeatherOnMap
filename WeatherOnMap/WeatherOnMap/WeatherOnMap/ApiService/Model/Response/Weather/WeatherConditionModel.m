//
//  WeatherConditionModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherConditionModel.h"
#import "UIImageView+WebCache.h"


@implementation WeatherConditionModel
@synthesize identificatorWeatherArray = _identificatorWeatherArray;
@synthesize descriptionWeather = _descriptionWeather;
@synthesize main = _main;
@synthesize icon = _icon;

- (id)initWithDictionary:(NSDictionary *)params{
    self = [super init];
    if (self) {
        self.descriptionWeather = [[params valueForKey:@"description"] objectAtIndex:0];

        self.icon = [[[UIImageView alloc] init] autorelease];
        NSString *url = [self urlIcon:[[params valueForKey:@"icon"] objectAtIndex:0]];
        [self.icon  setImageWithURL:[NSURL URLWithString:url]
                  placeholderImage:nil];
        
        self.identificatorWeatherArray  = [NSArray arrayWithArray:[params valueForKey:@"id"]];
        self.main = [params valueForKey:@"main"];
    }
    return self;
}
- (id)copyWithZone:(NSZone *)zone{
    WeatherConditionModel *copy = [[WeatherConditionModel alloc] init];
    copy.descriptionWeather = self.descriptionWeather;
    copy.icon = self.icon;
    copy.identificatorWeatherArray = self.identificatorWeatherArray;
    copy.main = self.main;
    return copy;
}

- (NSString *) urlIcon:(NSString*) code{
    
    NSString* url = [NSString stringWithFormat:@"%@%@.png", API_WEATHER_CONDITION_IMG_URL, code];
    return url;
}

- (void)dealloc
{
    self.icon = nil;
    self.identificatorWeatherArray = nil;
    self.descriptionWeather = nil;
    self.main = nil;
    [super dealloc];
}
- (NSString*) description{
    return [NSString stringWithFormat:@"description = %@  main = %@", self.descriptionWeather, self.main];
}
@end
