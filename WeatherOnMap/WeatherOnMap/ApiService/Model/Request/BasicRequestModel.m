//
//  BasicRequestModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicRequestModel.h"

@implementation BasicRequestModel
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize radius = _radius;
@synthesize cluster = _cluster;
@synthesize resultCountExpected = _resultCountExpected;
@synthesize forceReload = _forceReload;
- (id)init
{
    self = [super init];
    if (self) {
        self.forceReload = NO;
    }
    return self;
}
- (void)dealloc{
    self.cluster = nil;
    [super dealloc];
}
@end
