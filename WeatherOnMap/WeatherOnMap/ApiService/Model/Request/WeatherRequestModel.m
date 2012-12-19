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
    if (self.cluster){
        if (self.cluster.boolValue) [params setValue:@"yes" forKey:@"cluster"];
        else [params setValue:@"no" forKey:@"cluster"];
    }
    if (self.radius){
        [params setValue:[NSNumber numberWithDouble:self.radius] forKey:@"radius"];
    }
    
    
    return params;
}
@end
