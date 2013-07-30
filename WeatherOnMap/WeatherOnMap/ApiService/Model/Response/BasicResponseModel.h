//
//  BasicModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicResponseModel : NSObject
@property(nonatomic, assign) int resultCountExpected;
@property(nonatomic, assign) int cod;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy) NSArray *list;
@property(nonatomic, retain) NSManagedObjectContext *context;
- (id) initWithDictionary:(NSDictionary*) params;
@end
