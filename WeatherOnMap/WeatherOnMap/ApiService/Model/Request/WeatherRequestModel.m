//
//  WeatherRequestModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherRequestModel.h"

@implementation WeatherRequestModel
- (NSDictionary *)createParameters{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[NSNumber numberWithDouble:self.latitude] forKey:@"lat"];
    [params setValue:[NSNumber numberWithDouble:self.longitude] forKey:@"lon"];
    [params setValue:[NSNumber numberWithDouble:self.resultCountExpected] forKey:@"cnt"];
    return params;
}
@end
