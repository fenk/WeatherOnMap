//
//  WeatherModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicResponseModel.h"
#import <MapKit/MapKit.h>


@interface WeatherResponseModel : BasicResponseModel
@property(nonatomic, assign) int resultCountExpected;
@property(nonatomic, assign) int cod;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy) NSArray *list;
- (id) initWithDictionary:(NSDictionary*) params;
@end
