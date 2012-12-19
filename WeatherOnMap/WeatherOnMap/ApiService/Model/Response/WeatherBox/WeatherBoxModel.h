//
//  WeatherBoxModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherBoxModel : NSObject
@property(nonatomic, assign) int cloud;
@property(nonatomic, copy) NSString *datatype;
@property(nonatomic, assign) double lat;
@property(nonatomic, assign) double lon;
@property(nonatomic, assign) double humidity;
@property(nonatomic, assign) long long dt;
@property(nonatomic, assign) long long identificator;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) int prcp;
@property(nonatomic, assign) int pressure;
@property(nonatomic, assign) int prsp_type;
@property(nonatomic, assign) double temp;
@property(nonatomic, assign) double temp_min;
@property(nonatomic, assign) double temp_max;
@property(nonatomic, assign) int wind_deg;
@property(nonatomic, assign) int wind_ms;
@property(nonatomic, assign) int range;
@property(nonatomic, assign) int type;
- (id) initWithDictionary:(NSDictionary*) params;
@end
