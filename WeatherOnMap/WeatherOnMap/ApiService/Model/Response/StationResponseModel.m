//
//  StationModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "StationResponseModel.h"
#import "StationModel.h"

@implementation StationResponseModel


- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        
        self.resultCountExpected = [[params valueForKey:@"cnt"] integerValue];
        self.cod = [[params valueForKey:@"cod"] integerValue];
        self.message = [params valueForKey:@"message"];
        
        NSArray *list = [params valueForKey:@"list"];
        NSMutableArray *stations = [NSMutableArray array];
        for (id obj in list) {
            StationModel *stationModel = [[[StationModel alloc] initWithDictionary:obj] autorelease];
            [stations addObject:stationModel];
        }
        self.list = [NSArray arrayWithArray:stations];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}
@end
