//
//  LSIWeatherForecast.h
//  DailyWeather
//
//  Created by Joe Veverka on 7/15/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSICurrentForecast;
@class LSIDailyForecast;
@class LSIHourlyForecast;

NS_ASSUME_NONNULL_BEGIN

@interface LSIWeatherForecast : NSObject

@property (nonatomic, readonly) LSICurrentForecast *currentForecast;
@property (nonatomic, readonly) LSIDailyForecast *dailyForecast;
@property (nonatomic, readonly) LSIHourlyForecast *hourlyForecast;

@end

NS_ASSUME_NONNULL_END
