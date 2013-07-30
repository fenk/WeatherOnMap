//
//  WeatherAnnotation.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicAnnotationView.h"
#import "CDWeatherInfo.h"
@interface WeatherAnnotation : BasicAnnotationView{
    CDWeatherInfo *_weatherInfo;
}
@property(nonatomic, retain) CDWeatherInfo *weatherInfo;
@end
