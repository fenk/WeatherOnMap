//
//  CityResponseModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "CityResponseModel.h"
#import "CityModel.h"

/*
 
 @property (nonatomic, assign) double lat;
 @property (nonatomic, assign) double lon;
 @property (nonatomic, retain) NSString *country;
 @property (nonatomic, assign) long long identificator;
 @property (nonatomic, retain) NSString *name;
 @property (nonatomic, assign) int stationCount;
 @property (nonatomic, retain) NSString *url;
 
 */
 

@implementation CityResponseModel
- (id) initWithDictionary:(NSDictionary*) params{
    self = [super init];
    if (self) {
        
        self.lat = [[[[params valueForKey:@"city"] valueForKey:@"coord"] valueForKey:@"lat"] doubleValue];
        self.lon = [[[[params valueForKey:@"city"] valueForKey:@"coord"] valueForKey:@"lon"] doubleValue];
        self.country = [[params valueForKey:@"city"] valueForKey:@"country"];
        self.identificator = [[[params valueForKey:@"city"]valueForKey:@"id"] longLongValue];
        self.name = [[params valueForKey:@"city"] valueForKey:@"name"];
        self.url = [params valueForKey:@"url"];
        
        NSArray *list = [params valueForKey:@"list"];
        NSMutableArray *cities = [NSMutableArray array];
        for (id obj in list) {
            CityModel *cityModel = [[[CityModel alloc] initWithDictionary:obj] autorelease];
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
