//
//  WeatherBoxResponseModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherBoxResponseModel.h"
#import "WeatherBoxModel.h"
@implementation WeatherBoxResponseModel
- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        
        self.resultCountExpected = [[params valueForKey:@"cnt"] integerValue];
        self.cod = [[params valueForKey:@"cod"] integerValue];
        self.message = [params valueForKey:@"message"];
        
        NSArray *list = [params valueForKey:@"list"];
        NSMutableArray *weathers = [NSMutableArray array];
        for (id obj in list) {
            WeatherBoxModel *weatherBoxModel = [[WeatherBoxModel alloc] initWithDictionary:obj];
            [weathers addObject:weatherBoxModel];
        }
        self.list = [NSArray arrayWithArray:weathers];
    }
    return self;
}
@end
