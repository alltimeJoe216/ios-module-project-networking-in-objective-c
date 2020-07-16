//
//  PropertyUtil.h
//  DailyWeather
//
//  Created by Joe Veverka on 7/16/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PropertyUtil : NSObject

+ (NSDictionary *)propsFor:(Class)klass;

@end

NS_ASSUME_NONNULL_END
