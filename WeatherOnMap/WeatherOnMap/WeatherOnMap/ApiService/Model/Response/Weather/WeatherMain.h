//
//  WeatherMain.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/10/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherMain : NSObject<NSCopying>
@property(nonatomic, assign) int humidity;
@property(nonatomic, assign) int pressure;
@property(nonatomic, assign) double temp;
@property(nonatomic, assign) double temp_max;
@property(nonatomic, assign) double temp_min;

- (id) initWithDictionary:(NSDictionary*) params;
@end
