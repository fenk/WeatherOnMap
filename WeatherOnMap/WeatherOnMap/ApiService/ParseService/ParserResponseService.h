//
//  ParserResponseService.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicResponseModel.h"
#import "JSONKit.h"
@interface ParserResponseService : NSObject
+ (ParserResponseService*) sharedInstance;
- (BasicResponseModel*) parseJsonString:(NSString*) jsonString forExpectedClassModel:(Class) classModel;
@end
