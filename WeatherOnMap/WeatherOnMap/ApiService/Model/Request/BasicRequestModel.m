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
@synthesize resultCountExpected = _resultCountExpected;


- (void)dealloc{
    [super dealloc];
}
@end
