//
//  NSDictionary+UrlEncoding.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/3/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "NSDictionary+UrlEncoding.h"


@implementation NSDictionary (UrlEncoding)
// helper function: get the string form of any object
- (NSString*) toString:(id) object {
    return [NSString stringWithFormat: @"%@", object];
}

// helper function: get the url encoded string form of any object
- (NSString*) urlEncode: (id) object {
    NSString *string = [self toString:object];
    return [string stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
}

-(NSString*) urlEncodedString {
    NSMutableArray *parts = [NSMutableArray array];
    for (id key in self) {
        id value = [self objectForKey: key];
        NSString *part = [NSString stringWithFormat: @"%@=%@", [self urlEncode:key], [self urlEncode:value]];
        [parts addObject: part];
    }
    return [parts componentsJoinedByString: @"&"];
}



@end
