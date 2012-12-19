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
    
    NSDictionary *deserializedData = [jsonString objectFromJSONString];
    NSLog(@"%@", [deserializedData allKeys]);
    
    if (classModel == [WeatherRequestModel class]) {
    
        WeatherResponseModel *weatherResponse = [[[WeatherResponseModel alloc] initWithDictionary:deserializedData] autorelease];
        
        return weatherResponse;
        
    }else if (classModel == [WeatherBoxRequestModel class]) {
        
        WeatherBoxResponseModel *weatherResponse = [[[WeatherBoxResponseModel alloc] initWithDictionary:deserializedData] autorelease];
        
        return weatherResponse;
        
    }else if (classModel == [StationRequestModel class]){
        
        StationResponseModel *stationResponse = [[[StationResponseModel alloc] initWithDictionary:deserializedData] autorelease];
        
        return stationResponse;
    
    }else if (classModel == [CityRequestModel class]){
        
        CityResponseModel *cityResponse = [[[CityResponseModel alloc] initWithDictionary:deserializedData ] autorelease];
        
        return cityResponse;
    }
    
    
    return nil;
}
@end
