//
//  ServiceHTTPRequest.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "ServiceHTTPRequest.h"

@implementation ServiceHTTPRequest
@synthesize requestModel = _requestModel;
@synthesize caller = _caller;
- (void)dealloc{
    [self.requestModel release];
    [super dealloc];
}
@end
