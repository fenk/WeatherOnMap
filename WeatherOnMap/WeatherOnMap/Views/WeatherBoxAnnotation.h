//
//  WeatherBoxAnnotation.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import "BasicAnnotationView.h"
#import "WeatherBoxModel.h"
@interface WeatherBoxAnnotation : BasicAnnotationView{
    WeatherBoxModel *_weatherBoxModel;
}
@property(nonatomic, copy) WeatherBoxModel *weatherBoxModel;
@end
