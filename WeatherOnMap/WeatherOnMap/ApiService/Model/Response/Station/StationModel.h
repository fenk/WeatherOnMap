//
//  StationModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherWind.h"
#import "WeatherMain.h"
#import "WeatherCloud.h"
#import "WeatherRain.h"
#import "WeatherVisibility.h"
#import "StationConditionModel.h"

typedef enum StationType {
    StationTypeAirport = 1,
    StationTypeSWOP = 2,
    StationTypeSYNOP = 3,
    StationTypeUnknown = 4,
    StationTypeDIY = 5
} StationType;


@interface StationModel : NSObject
@property(nonatomic, assign) double distance;
@property(nonatomic, assign) double lat;
@property(nonatomic, assign) double lon;
@property(nonatomic, assign) long long dt;
@property(nonatomic, assign) long long identificator;
@property(nonatomic, assign) int range;
@property(nonatomic, assign) int type;
@property(nonatomic, copy) WeatherCloud *cloud;
@property(nonatomic, copy) WeatherMain *main;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) StationConditionModel *stationCondition;
@property(nonatomic, copy) WeatherWind *weatherWind;
@property(nonatomic, copy) WeatherRain *rain;
@property(nonatomic, copy) WeatherVisibility *visibility;
- (id) initWithDictionary:(NSDictionary*) params;
@end
