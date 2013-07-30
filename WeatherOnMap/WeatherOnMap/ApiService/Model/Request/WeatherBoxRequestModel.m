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
    [params setValue:@"55a83e1b65020a59b09fc40187f2d75b" forKey:@"APPID"];
//    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.leftTop.latitude] forKey:@"lat1"];
//    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.rightBottom.latitude] forKey:@"lat2"];
//    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.leftTop.longitude] forKey:@"lng1"];
//    [params setValue:[NSString stringWithFormat:@"%f",self.bbox.rightBottom.longitude] forKey:@"lng2"];
    
    [params setValue:[NSString stringWithFormat:@"%f,%f,%f,%f",self.bbox.leftTop.longitude,self.bbox.leftTop.latitude, self.bbox.rightBottom.longitude,self.bbox.rightBottom.latitude] forKey:@"bbox"];
    return params;
    
}
@end
