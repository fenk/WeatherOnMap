//
//  BasicAnnotationView.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/19/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BasicAnnotationView : MKAnnotationView<MKAnnotation>{
    CLLocationCoordinate2D _coordinate;
}

@end
