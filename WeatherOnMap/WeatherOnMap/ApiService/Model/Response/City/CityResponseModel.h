//
//  CityResponseModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicResponseModel.h"

@interface CityResponseModel : BasicResponseModel

@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lon;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, assign) long long identificator;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) int stationCount;
@property (nonatomic, retain) NSString *url;


@end
