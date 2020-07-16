//
//  LSIWeatherConditions.m
//  DailyWeather
//
//  Created by Joe Veverka on 7/15/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSIWeatherConditions.h"
#import "PropertyUtil.h"

@implementation LSIWeatherConditions

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *properties = [PropertyUtil propsFor:[self class]];
    NSDictionary *codingKeys = @{@"iconString": @"icon"};
    
    if (self = [super init])
        
    {
        for (NSString *propertyName in [properties keyEnumerator])
            
        {
            NSString *codingKey = codingKeys[propertyName];
            
            if (!codingKey) {
                codingKey = propertyName;
            }
            
            NSString *propertyType = [properties valueForKey:propertyName];
            
            id value = [dictionary objectForKey:codingKey];
            
            // NSNull -> nil, if json key is there but no value is present
            if ([value isKindOfClass:[NSNull class]])
                
            {
                value = nil;
            }
            
            if (value && [propertyType isEqualToString:@"NSDate"])
                
            {
                // Decode that date
                NSNumber *dateNum = [dictionary objectForKey:codingKey];
                value = [NSDate
                         dateWithTimeIntervalSince1970:dateNum.doubleValue];
            }
            
            [self setValue:value forKey:propertyName];
            
        }
    }
    
    return self;
    
}

@end
