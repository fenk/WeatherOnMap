//
//  WeatherCurrentCache.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/18/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherBoxModel.h"

@interface WeatherCurrentCache : NSObject
@property(nonatomic, retain) NSMutableDictionary *weathers;
@property(nonatomic, retain) NSMutableSet *weatherKeys;
+ (WeatherCurrentCache*) sharedInstance;
- (BOOL) addWeatherBoxModel:(WeatherBoxModel*) weatherBoxModel;
@end
