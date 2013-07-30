//
//  CDCityData+Extension.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/31/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDCityData.h"
#import "CDObject+Extension.h"

@interface CDCityData (Extension)
+ (id) createObjectWithDictionary:(NSArray*) array;
- (void) fillWithArray:(NSArray*) array;
@end
