//
//  WeatherVisibility.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherVisibility : NSObject
@property(nonatomic, copy) NSString *prefix;
@property(nonatomic, assign) double distance;
- (id)initWithDictionary:(NSDictionary *)params;
@end
