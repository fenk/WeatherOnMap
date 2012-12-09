//
//  ServiceHTTPRequest.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "ASIHTTPRequest.h"
#import "Models.h"
#import "WeatherOnMapService.h"
@interface ServiceHTTPRequest : ASIHTTPRequest
@property(nonatomic, retain) BasicRequestModel *requestModel;
@property(nonatomic, assign) id<WeatherOnMapServiceDelegate> caller;
@end
