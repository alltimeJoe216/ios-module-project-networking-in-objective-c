//
//  LSIWeatherConditions.h
//  DailyWeather
//
//  Created by Joe Veverka on 7/15/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIWeatherConditions : NSObject

@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly, nullable, copy) NSString *summary;
@property (nonatomic, readonly, nullable, copy) NSString *iconString;
@property (nonatomic, readonly, nullable) NSNumber *precipProbability;
@property (nonatomic, readonly, nullable) NSNumber *precipIntensity;
@property (nonatomic, readonly, nullable) NSNumber *precipType;
@property (nonatomic, readonly, nullable) NSNumber *humidity;
@property (nonatomic, readonly, nullable) NSNumber *pressure;
@property (nonatomic, readonly, nullable) NSDate *sunriseTime;
@property (nonatomic, readonly, nullable) NSDate *sunsetTime;
@property (nonatomic, readonly, nullable) NSNumber *temperature;
@property (nonatomic, readonly, nullable) NSNumber *apparentTemperatureHigh;
@property (nonatomic, readonly, nullable) NSNumber *apparentTemperature;
@property (nonatomic, readonly, nullable) NSNumber *temperatureLow;
@property (nonatomic, readonly, nullable) NSNumber *temperatureHigh;
@property (nonatomic, readonly, nullable) NSNumber *windSpeed;
@property (nonatomic, readonly, nullable) NSNumber *windBearing;
@property (nonatomic, readonly, nullable) NSNumber *uvIndex;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
