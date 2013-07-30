//
//  WeatherConditionModel.h
//  WeatherOnMap
//
//  Created by Jacek Grygiel on 12/9/12.
//  Copyright (c) 2012 Jacek Grygiel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum WeatherConditionType {
    ThunderstormWithLightRain = 200,
    ThunderstormWithRain = 201,
    ThunderstormWithHeavyRain = 202,
    ThunderstormLight = 210,
    Thunderstorm = 211,
    ThunderstormHeavy = 212,
    ThunderstormRagged = 221,
    ThunderstormWithLightDrizzle = 230,
    ThunderstormWithDrizzle = 231,
    ThunderstormWithHeavyDrizzle = 232,
    DrizzleLight = 300,
    Drizzle = 301,
    DrizzleHeavy = 302,
    DrizzleLightWithRain = 310,
    DrizzleWithRain = 311,
    DrizzleHeavyWithRain = 312,
    DrizzleShower = 321,
    RainLight = 500,
    RainModerate = 501,
    RaingHeavy = 502,
    RainVeryHeavy = 503,
    RainExtreme = 504,
    RainFreezeing = 511,
    RainLightShower = 520,
    RainShower = 521,
    RainHeavyShower = 522,
    SnowLight = 600,
    Snow = 601,
    SnowHeavy = 602,
    SnowSleet = 611,
    SnowShower = 621,
    AtmosphereMist = 701,
    AtmosphereSmoke = 711,
    AtmosphereHaze = 721,
    AtmosphereSandDustWhirls = 731,
    AtmosphereFog = 741,
    CloudsSkyIsClear = 800,
    CloudsFew = 801,
    CloudsScattered = 802,
    CloudsBroken = 803,
    CloudsOvercast = 804,
    ExtremeTornado = 900,
    ExtremeTropicalStorm = 901,
    ExtremeHurricane = 902,
    ExtremeCold = 903,
    ExtremeHot = 904,
    ExtremeWindy = 905,
    ExtremeHail = 906
    } WeatherConditionType;

@interface WeatherConditionModel : NSObject<NSCopying>
@property(nonatomic, copy) NSArray *identificatorWeatherArray;
@property(nonatomic, copy) NSString *descriptionWeather;
@property(nonatomic, retain) UIImageView *icon;
@property(nonatomic, copy) NSString *main;

- (id)initWithDictionary:(NSDictionary *)params;
- (NSString *) urlIcon:(NSString*) code;
@end
