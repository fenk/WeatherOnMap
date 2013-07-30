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

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)dealloc{
    self.cluster = nil;
    [super dealloc];
}
@end
