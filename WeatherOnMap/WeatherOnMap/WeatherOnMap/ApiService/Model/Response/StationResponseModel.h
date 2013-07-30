//
//  StationModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicResponseModel.h"

@interface StationResponseModel : BasicResponseModel

- (id) initWithDictionary:(NSDictionary*) params;
@end
