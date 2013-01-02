//
//  BasicModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicResponseModel.h"

@implementation BasicResponseModel
@synthesize resultCountExpected = _resultCountExpected;
@synthesize cod = _cod;
@synthesize list = _list;
@synthesize message = _message;

- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    self.list = nil;
    [super dealloc];
}

@end
