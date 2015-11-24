//
//  NSObject+RuntimeMethods.m
//
//  Created by Yang Xudong.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "NSObject+RuntimeMethods.h"
#import <objc/message.h>

@implementation NSObject (RuntimeMethods)

-(NSArray *)propertyList
{
    unsigned int count;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++)
    {
        const char *propertyName = property_getName(properties[i]);
        
        [list addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    if (list.count)
    {
        return list;
    }
    
    return nil;
}

-(NSDictionary *)propertyValues
{
    NSArray *propertyList = [self propertyList];
    
    if (!propertyList || !propertyList.count)
    {
        return nil;
    }
    
    NSMutableDictionary *propertyValues = [NSMutableDictionary dictionaryWithCapacity:propertyList.count];
    
    for (NSString *valueKey in propertyList)
    {
        id value = [self valueForKey:valueKey];
        
        if (value)
        {
            [propertyValues setObject:value forKey:valueKey];
        }
    }
    
    if (propertyValues.count)
    {
        return propertyValues;
    }
    
    return nil;
}

-(NSDictionary *)allPropertyValues
{
    NSArray *propertyList = [self propertyList];
    
    if (!propertyList || !propertyList.count)
    {
        return nil;
    }
    
    NSMutableDictionary *propertyValues = [NSMutableDictionary dictionaryWithCapacity:propertyList.count];
    
    for (NSString *valueKey in propertyList)
    {
        id value = [self valueForKey:valueKey];
        
        if (!value)
        {
            value = [NSNull null];
        }
        
        [propertyValues setObject:value forKey:valueKey];
    }
    
    return propertyValues;
}

-(void)voluationWithData:(id)data
{
    NSArray *propertyList = [self propertyList];
    
    if (!propertyList || !propertyList.count || !data || [data isKindOfClass:[NSNull class]])
    {
        return;
    }
    
    for (NSString *valueKey in propertyList)
    {
        BOOL valid;
        
        if ([data isKindOfClass:[NSDictionary class]])
        {
            valid = ([data valueForKey:valueKey] == nil)?NO:YES;
        }
        else
        {
            valid = [data respondsToSelector:NSSelectorFromString(valueKey)];
        }
        
        if (valid)
        {
            id value = [data valueForKey:valueKey];
            
            if (value && ![value isKindOfClass:[NSNull class]])
            {
                [self setValue:value forKey:valueKey];
            }
        }
    }
}

-(NSArray *)methodList
{
    unsigned int count;
    
    Method *methods = class_copyMethodList([self class], &count);
    
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++)
    {
        NSString *methodName = NSStringFromSelector(method_getName(methods[i]));
        
        [list addObject:methodName];
    }
    
    if (list.count)
    {
        return list;
    }
    
    return nil;
}

-(NSArray *)ivarList
{
    unsigned int count;
    
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++)
    {
        const char *ivarName = ivar_getName(ivars[i]);
        
        [list addObject:[NSString stringWithUTF8String:ivarName]];
    }
    
    if (list.count)
    {
        return list;
    }
    
    return nil;
}

@end