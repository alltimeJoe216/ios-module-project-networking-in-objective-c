//
//  PropertyUtil.m
//  DailyWeather
//
//  Created by Joe Veverka on 7/16/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "PropertyUtil.h"
#import "objc/runtime.h"

@implementation PropertyUtil


static const char *getPropertyType(objc_property_t
                                   property) {
    const char *attributes = property_getAttributes(property);
    
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL)
    {
        if (attribute[0] == 'T' && attribute[1] != '@')
            
        {
            
            return (const char *)[[NSData           dataWithBytes:(attribute + 1) length:strlen(attribute) - 1] bytes];
        }
        
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2)
            
        {
            
            return "id";
        }
        
        else if (attribute[0] == 'T' && attribute[1] == '@')
            
        {
            
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
        }
        
    }
    
    return "";
}

+ (NSDictionary *)propsFor:(Class)klass
{
    if (klass == NULL)
        
    {
        return nil;
    }
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    unsigned int outCount, j;
    objc_property_t *properties = class_copyPropertyList(klass, &outCount);
    
    for (j = 0; j < outCount; j++)
        
    {
        objc_property_t property = properties[j];
        const char *propertyName = property_getName(property);
        
        if(propertyName)
        {
            const char *propType = getPropertyType(property);
            NSString *propName = [NSString stringWithUTF8String:propertyName];
            NSString *propertyType = [NSString stringWithUTF8String:propType];
            [results setObject:propertyType forKey:propName];
        }
        
    }
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:results];
}


@end
