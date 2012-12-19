//
//  WeatherAnnotation.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/17/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "WeatherBoxModel.h"
@interface WeatherAnnotation : NSObject<MKAnnotation>{
CLLocationCoordinate2D _coordinate;
    WeatherBoxModel *_weatherBoxModel;
}
@property(nonatomic, retain) WeatherBoxModel *weatherBoxModel;
@end
