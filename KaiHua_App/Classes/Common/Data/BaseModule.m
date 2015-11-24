//
//  BaseModule.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "BaseModule.h"

@implementation BaseModule


//重载可以选择 使用的LKDBHelper
+(LKDBHelper *)getUsingLKDBHelper
{
    static LKDBHelper* db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString* dbpath = [[LKDBUtils getDocumentPath] stringByAppendingPathComponent:@"db/kaihua.db"];
        db = [[LKDBHelper alloc]initWithDBPath:dbpath];
    });
    return db;
}



@end
