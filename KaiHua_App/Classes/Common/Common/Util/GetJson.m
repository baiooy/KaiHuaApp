//
//  AppDelegate.h
//  ShouGouAPP
//
//  Created by yczx on 13-3-25.
//  Copyright (c) 2013年 yczx. All rights reserved.
//

#import "GetJson.h"
#import <SBJson.h>

@implementation GetJson


+ (GetJson *)shareInstance{
    static dispatch_once_t pred;
    static GetJson *instance = nil;
    dispatch_once(&pred, ^{
        instance = [[self alloc] initGetJson];
    });
    
    return instance;
    
}

- (id)initGetJson{
    self  = [super init];
    if (self == [super init]){
    
    }
    return self;
}


//json返回的是一个字典
- (NSMutableDictionary *)parseTheJson:(NSString *)content
{
    NSMutableDictionary *jsonContent;
    jsonContent = [content JSONValue];
    return jsonContent;
}

//json返回的是一个数组
- (NSMutableArray *)parseTheJsonArr:(NSString *)content
{
    NSMutableArray *jsonContent;
    jsonContent = [content JSONValue];
    return jsonContent;
}
@end
