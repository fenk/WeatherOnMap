//
//  WeatherModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherResponseModel.h"
#import "WeatherModel.h"
@implementation WeatherResponseModel

@synthesize resultCountExpected = _resultCountExpected;
@synthesize cod = _cod;
@synthesize list = _list;
@synthesize message = _message;

- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        
        self.resultCountExpected = [[params valueForKey:@"cnt"] integerValue];
        self.cod = [[params valueForKey:@"cod"] integerValue];
        self.message = [params valueForKey:@"message"];
        
        NSArray *list = [params valueForKey:@"list"];
        NSMutableArray *weathers = [NSMutableArray array];
        for (id obj in list) {
            WeatherModel *weatherModel = [[WeatherModel alloc] initWithDictionary:obj];
            [weathers addObject:weatherModel];
        }
        self.list = [NSArray arrayWithArray:weathers];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}
@end
