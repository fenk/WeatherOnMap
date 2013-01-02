//
//  CityRequestModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicRequestModel.h"

@interface CityRequestModel : BasicRequestModel
@property(nonatomic, retain) NSString *cityName;
@property(nonatomic, assign) long long identificator;
- (NSDictionary *)createParametersWithCityName:(NSString*) cityName;
@end
