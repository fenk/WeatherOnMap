//
//  WeatherAnnotation.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicAnnotationView.h"
#import "WeatherModel.h"
@interface WeatherAnnotation : BasicAnnotationView{
    WeatherModel *_weatherModel;
}
@property(nonatomic, retain) WeatherModel *weatherModel;
@end
