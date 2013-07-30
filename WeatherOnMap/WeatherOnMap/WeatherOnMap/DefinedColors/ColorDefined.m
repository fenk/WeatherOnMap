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
    return [UIColor colorWithRed:115/255.0 green:155/255.0 blue:115/255.0 alpha:1.0];
}
+(UIColor *)backgroundColor{
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"background2.png"]];
}


+(UIColor*) tabbarColor{
    return [UIColor colorWithRed:82/255.0 green:131/255.0 blue:82/255.0 alpha:1.0];
}

+(UIColor*) tabbarDarkerColor{
    return [UIColor colorWithRed:62/255.0 green:131/255.0 blue:62/255.0 alpha:1.0];
}
@end
