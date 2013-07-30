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
@synthesize identificator = _identificator;
- (NSDictionary *)createParameters{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[NSNumber numberWithDouble:self.latitude] forKey:@"q"];
    [params setValue:@"imperial" forKey:@"units"];
    [params setValue:@"55a83e1b65020a59b09fc40187f2d75b" forKey:@"APPID"];
    return params;
}
- (NSDictionary *)createParametersWithCityName:(NSString*) cityName{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:cityName forKey:@"q"];
    [params setValue:@"imperial" forKey:@"units"];
    [params setValue:@"55a83e1b65020a59b09fc40187f2d75b" forKey:@"APPID"];
    return params;
}

@end
