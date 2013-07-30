//
//  CDCityDetail.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CDObject+Extension.h"


@interface CDCityDetail : CDObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * country;
@property (nonatomic) int64_t population;

@end
