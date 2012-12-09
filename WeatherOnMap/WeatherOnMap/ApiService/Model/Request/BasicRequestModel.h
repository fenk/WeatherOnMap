//
//  BasicRequestModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+UrlEncoding.h"

@protocol BasicRequestModelProtocol <NSObject>
@optional
- (NSDictionary*) createParameters;
@end

@interface BasicRequestModel : NSObject<BasicRequestModelProtocol>
@property(nonatomic, assign) double latitude;
@property(nonatomic, assign) double longitude;
@property(nonatomic, assign) int resultCountExpected;

@end
