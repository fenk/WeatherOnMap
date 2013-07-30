//
//  WeatherMain.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WeatherMain : NSManagedObject

@property (nonatomic) int64_t humidity;
@property (nonatomic) int64_t pressure;
@property (nonatomic) double temp;
@property (nonatomic) double temp_max;
@property (nonatomic) double temp_min;

@end
