//
//  WeatherBoxRequestModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherBoxRequestModel.h"

@implementation WeatherBoxRequestModel
- (NSDictionary *)createParameters{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@"city" forKey:@"type"];
    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.leftTop.latitude] forKey:@"lat1"];
    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.rightBottom.latitude] forKey:@"lat2"];
    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.leftTop.longitude] forKey:@"lng1"];
    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.rightBottom.longitude] forKey:@"lng2"];
    return params;
    
}
@end
