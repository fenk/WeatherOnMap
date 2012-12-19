//
//  WeatherCloud.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/16/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherCloud : NSObject<NSCopying>
@property(nonatomic, assign) int all;
@property(nonatomic, assign) double distance;
@property(nonatomic, copy) NSString* condition;
@property(nonatomic, copy) NSString* cumulus;
- (id)initWithDictionary:(NSDictionary *)params;
@end
