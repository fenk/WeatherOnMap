//
//  StationConditionModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StationConditionModel : NSObject
@property(nonatomic, copy) NSArray *identificatorWeatherArray;
@property(nonatomic, copy) NSString *descriptionWeather;
@property(nonatomic, retain) UIImageView *icon;
@property(nonatomic, copy) NSString *main;

- (id)initWithDictionary:(NSDictionary *)params;
- (NSString *) urlIcon:(NSString*) code;
@end
