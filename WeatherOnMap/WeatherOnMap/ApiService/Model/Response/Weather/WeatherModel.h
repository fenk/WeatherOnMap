//
//  WeatherModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherConditionModel.h"
#import "WeatherMain.h"
#import "WeatherConditionModel.h"
#import "WeatherWind.h"

@interface WeatherModel : NSObject
{

}
@property(nonatomic, assign) int cloudsNumber;
@property(nonatomic, assign) double distance;
@property(nonatomic, assign) double lat;
@property(nonatomic, assign) double lon;
@property(nonatomic, assign) long long dt;
@property(nonatomic, assign) long long identificator;
@property(nonatomic, copy) WeatherMain *main;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) WeatherConditionModel *weatherCondition;
@property(nonatomic, copy) WeatherWind *weatherWind;

- (id) initWithDictionary:(NSDictionary*) params;



@end
