//
//  ParserResponseService.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "ParserResponseService.h"
#import "Models.h"
@implementation ParserResponseService
static ParserResponseService *instance = nil;

+ (ParserResponseService*) sharedInstance{
    if (instance == nil) {
        instance = [[ParserResponseService alloc] init];
    }
    return instance;
}

- (BasicResponseModel*) parseJsonString:(NSString*) jsonString forExpectedClassModel:(Class) classModel{
    
    
    
    if (classModel == [WeatherRequestModel class]) {
    
        WeatherResponseModel *weatherResponse = [[[WeatherResponseModel alloc] init] autorelease];
        
        return weatherResponse;
        
    }else if (classModel == [StationRequestModel class]){
        
        StationResponseModel *stationResponse = [[[StationResponseModel alloc] init] autorelease];
        
        return stationResponse;
    }
    
    
    return nil;
}
@end
