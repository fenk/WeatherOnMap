//
//  CDWeatherVisibility.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CDObject+Extension.h"


@interface CDWeatherVisibility : CDObject

@property (nonatomic, retain) NSString * prefix;
@property (nonatomic) double distance;

@end
