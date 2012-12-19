//
//  WeatherCurrentCache.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/18/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherCurrentCache.h"

@implementation WeatherCurrentCache
@synthesize weathers = _weathers;
@synthesize weatherKeys = _weatherKeys;
static WeatherCurrentCache *instance = nil;

+ (WeatherCurrentCache*) sharedInstance{
    if (instance == nil) {
        instance = [[WeatherCurrentCache alloc] init];
        instance.weathers = [[[NSMutableDictionary alloc] init] autorelease];
        instance.weatherKeys = [[[NSMutableSet alloc] init] autorelease];
    }
    return instance;
}

- (BOOL) addWeatherBoxModel:(WeatherBoxModel*) weatherBoxModel{
    
    if (![self.weatherKeys containsObject:[NSString stringWithFormat:@"%lld",weatherBoxModel.identificator]]) {
        [self.weathers setValue:weatherBoxModel forKey:[NSString stringWithFormat:@"%lld",weatherBoxModel.identificator]];
        [self.weatherKeys addObject:[NSString stringWithFormat:@"%lld",weatherBoxModel.identificator]];
        return YES;
    }else{
        return NO;
    }

}

- (void) addWeatherModels:(NSArray*) weatherModels{
    CFAbsoluteTime timeC = CFAbsoluteTimeGetCurrent();

    for (WeatherBoxModel *model in weatherModels) {
        [self addWeatherBoxModel:model];
    }
    
    NSLog(@"time = %f", CFAbsoluteTimeGetCurrent()-timeC);
    NSLog(@"objects = %d", self.weathers.allValues.count);
}
@end
