//
//  CityModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModel.h"
#import "StationModel.h"
@interface CityModel : WeatherModel
{
    NSString *_url;
    NSString *_country;
    long long _population;
}
@property(nonatomic, retain) NSString *url;
@property(nonatomic, retain) NSString *country;
@property(nonatomic, assign) long long population;
@end