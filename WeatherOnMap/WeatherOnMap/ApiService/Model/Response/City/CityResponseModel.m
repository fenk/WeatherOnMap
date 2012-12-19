//
//  CityResponseModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "CityResponseModel.h"
#import "CityModel.h"
@implementation CityResponseModel
- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        
        
        NSArray *list = [params valueForKey:@"list"];
        NSMutableArray *cities = [NSMutableArray array];
        for (id obj in list) {
            CityModel *cityModel = [[CityModel alloc] initWithDictionary:obj];
            [cities addObject:cityModel];
        }
        self.list = [NSArray arrayWithArray:cities];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
