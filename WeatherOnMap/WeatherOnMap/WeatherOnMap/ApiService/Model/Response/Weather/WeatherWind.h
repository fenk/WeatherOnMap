//
//  WeatherWind.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/10/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherWind : NSObject<NSCopying>
@property(nonatomic, assign) int degree;
@property(nonatomic, assign) double gust;
@property(nonatomic, assign) double speed;
@property(nonatomic, assign) int var_begin;
@property(nonatomic, assign) int var_end;
- (id)initWithDictionary:(NSDictionary *)params;
@end
