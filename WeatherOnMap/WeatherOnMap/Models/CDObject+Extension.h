//
//  CDObject+Extension.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 7/30/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "CDObject.h"

@interface CDObject (Extension)
+ (NSArray *)fetchObjectsOfClass:(__unsafe_unretained Class)aClass
                        sortedBy:(NSArray *)sortDescriptors
                    filterString:(NSString *)filterString;

+ (id) createNewObject;
- (void) fillWithDictionary:(NSDictionary*) dictionary;
@end
