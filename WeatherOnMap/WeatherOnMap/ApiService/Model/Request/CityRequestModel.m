//
//  CityRequestModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "CityRequestModel.h"

@implementation CityRequestModel
@synthesize cityName = _cityName;
- (NSDictionary *)createParameters{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[NSNumber numberWithDouble:self.latitude] forKey:@"q"];
    return params;
}
@end
