//
//  WeatherOnMapService.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 10/25/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

/* 
 
 This service is responsible for fetch appropriate information about weather based on the
 openweathermap.com API 
 
 */

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "Models.h"
#import "BasicResponseModel.h"

@protocol WeatherOnMapServiceDelegate;

@protocol WeatherOnMapServiceDelegate <NSObject>
- (void) didReceiveResponse:(BasicResponseModel*) basicResponse fromCoreData:(BOOL) coreData;
- (void) didReceiveError:(NSError*) error;

@end

@interface WeatherOnMapService : NSObject<WeatherOnMapServiceDelegate>

+ (WeatherOnMapService*) sharedInstance;
- (void) cancelAllRequest;

- (void) getWeather:(WeatherRequestModel*) request withCaller:(id<WeatherOnMapServiceDelegate>) caller;
- (void) getWeatherByBBox:(WeatherRequestModel *)request withCaller:(id<WeatherOnMapServiceDelegate>)caller;
- (void) getStation:(StationRequestModel*) request withCaller:(id<WeatherOnMapServiceDelegate>) caller;
- (void) getCity:(CityRequestModel*) request withCaller:(id<WeatherOnMapServiceDelegate>) caller;
- (void) findCityByName:(NSString*) cityName withCaller:(id<WeatherOnMapServiceDelegate>) caller;

- (void) getCityByIdentificator:(CityRequestModel*) request withCaller:(id<WeatherOnMapServiceDelegate>) caller;
@end



