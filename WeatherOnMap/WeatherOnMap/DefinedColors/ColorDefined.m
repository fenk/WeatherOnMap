//
//  ColorDefined.m
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 4/24/13.
//  Copyright (c) 2013 Jacek Grygiel. All rights reserved.
//

#import "ColorDefined.h"

@implementation ColorDefined
+(UIColor *)navigationBarColor{
    return [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
}
+(UIColor *)backgroundColor{
    return [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
}


+(UIColor*) tabbarColor{
    return [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
}

+(UIColor*) tabbarDarkerColor{
    return [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
}
@end
