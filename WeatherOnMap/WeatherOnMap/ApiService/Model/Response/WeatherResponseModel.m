//
//  WeatherModel.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherResponseModel.h"
#import "CDWeatherInfo+Extension.h"
#import "AppDelegate.h"
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
            

            double lat = [[[obj valueForKey:@"coord"]valueForKey:@"lat"] doubleValue];
            double lon = [[[obj valueForKey:@"coord"]valueForKey:@"lon"] doubleValue];
            
            NSArray *objects = [CDObject fetchObjectsOfClass:[CDWeatherInfo class] sortedBy:nil filterString:[NSString stringWithFormat:@"lat == %f AND lon == %f", lat, lon]];
            
            if (objects.count == 0) {
                CDWeatherInfo *weatherInfo = [CDWeatherInfo createObjectWithDictionary:obj];
                [weathers addObject:weatherInfo];

            }else{
                [weathers addObject:[objects objectAtIndex:0]];
            }
        }
        
        
        self.list = [NSArray arrayWithArray:weathers];
        
        [[AppDelegate sharedDelegate] saveContext];
        
        
    }
    return self;
}



- (void)dealloc
{
    [super dealloc];
}
@end
