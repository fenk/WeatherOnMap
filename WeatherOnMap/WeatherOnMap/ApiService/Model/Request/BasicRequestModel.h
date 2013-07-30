//
//  BasicRequestModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+UrlEncoding.h"
#import <MapKit/MapKit.h>

typedef struct BBox {
    CLLocationCoordinate2D leftTop;
    CLLocationCoordinate2D rightBottom;
    int additionalParam;
}BBox;

CG_INLINE BBox
BBoxMake(CLLocationCoordinate2D leftTop, CLLocationCoordinate2D rightBottom)
{
    BBox bbox; bbox.leftTop = leftTop; bbox.rightBottom = rightBottom; return bbox;
}


@protocol BasicRequestModelProtocol <NSObject>
@optional
- (NSDictionary*) createParameters;
@end

@interface BasicRequestModel : NSObject<BasicRequestModelProtocol>
@property(nonatomic, assign) double latitude;
@property(nonatomic, assign) double longitude;
@property(nonatomic, assign) int resultCountExpected;
@property(nonatomic, retain) NSNumber *cluster;
@property(nonatomic, assign) double radius;
@property(nonatomic, assign) BBox bbox;

@property(nonatomic, assign) BOOL forceReload;
@end
