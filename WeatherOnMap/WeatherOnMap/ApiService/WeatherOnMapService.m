//
//  WeatherOnMapService.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 10/25/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "WeatherOnMapService.h"
#import "NSDictionary+UrlEncoding.h"
#import "ParserResponseService.h"
#import "ServiceHTTPRequest.h"
@interface WeatherOnMapService ()

@property(nonatomic,retain) NSOperationQueue *mainQueue;
@property(nonatomic,retain) ASIHTTPRequest *request;
- (NSString*) joinBaseUrl:(NSString*) base withDictionaryParams:(NSDictionary*) params;
- (void) parseResponse:(id) model requestParameters:(NSDictionary*) request responseParameters:(NSDictionary*) response;
@end

@implementation WeatherOnMapService
@synthesize mainQueue = _mainQueue;
@synthesize request = _request;

static WeatherOnMapService *instance = nil;

+ (WeatherOnMapService*) sharedInstance{
    
    if (instance == nil) {
        instance = [[WeatherOnMapService alloc] init];
    }
    return instance;
}

- (NSString*) joinBaseUrl:(NSString*) base withDictionaryParams:(NSDictionary*) params{
    return [base stringByAppendingString:[params urlEncodedString]];
}


- (void) getWeather:(WeatherRequestModel *)request withCaller:(id)caller{
    NSString *baseUrl = [NSString stringWithFormat:@"%@%@", API_ADDRESS_URL, @"city?"];
    NSString *url = [self joinBaseUrl:baseUrl withDictionaryParams:[request createParameters]];
    [self sendRequestWithUrl:url withRequestModel:request withCaller:caller];
}
- (void) getStation:(StationRequestModel*) request withCaller:(id) caller{
    NSString *baseUrl = [NSString stringWithFormat:@"%@%@", API_ADDRESS_URL, @"station?"];
    NSString *url = [self joinBaseUrl:baseUrl withDictionaryParams:[request createParameters]];
    [self sendRequestWithUrl:url withRequestModel:request withCaller:caller];
}


- (void) sendRequestWithUrl:(NSString*) urlString withRequestModel:(BasicRequestModel*) requestModel withCaller:(id) caller{
    if (!self.mainQueue) {
        [self setMainQueue:[[[NSOperationQueue alloc] init] autorelease]];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    ServiceHTTPRequest *request = [ServiceHTTPRequest requestWithURL:url];
    [request setCaller:caller];
    [request setRequestModel:requestModel];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(requestFinishedWithSuccess:)];
    [request setDidFailSelector:@selector(requestFinishedWithError:)];
    [self.mainQueue addOperation:request];
    
}

- (void)requestFinishedWithSuccess:(ServiceHTTPRequest *)request
{
    NSString *response = [request responseString];
    
    BasicResponseModel *responseModel = [[ParserResponseService sharedInstance] parseJsonString:response forExpectedClassModel:[request.requestModel class]];
    
    if ([request.caller respondsToSelector:@selector(didReceiveResponse:)]) {
        [request.caller didReceiveResponse:responseModel];
    }
}

- (void)requestFinishedWithError:(ServiceHTTPRequest *)request
{
    NSError *error = [request error];
    
    if ([request.caller respondsToSelector:@selector(didReceiveError:)]) {
        [request.caller didReceiveError:error];
    }
}

- (void)dealloc
{
    [self.request clearDelegatesAndCancel];
    [self.request release];
    [self.mainQueue release];
    [super dealloc];
}

@end
