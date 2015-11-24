//
//  DataModule.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "DataModule.h"

@implementation DataModule

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


//在类 初始化的时候
+(void)initialize
{
   /*
    //remove unwant property
    //比如 getTableMapping 返回nil 的时候   会取全部属性  这时候 就可以 用这个方法  移除掉 不要的属性
    [self removePropertyWithColumnName:@"error"];
    
    
    //simple set a column as "LKSQL_Mapping_UserCalculate"
    //根据 属性名  来启用自己计算
    //[self setUserCalculateForCN:@"error"];
    
    
    //根据 属性类型  来启用自己计算
    //[self setUserCalculateForPTN:@"NSDictionary"];
    
    //enable own calculations
    [self setUserCalculateForCN:@"address"];
    
    //enable the column binding property name
    [self setTableColumnName:@"MyAge" bindingPropertyName:@"age"];
    [self setTableColumnName:@"MyDate" bindingPropertyName:@"date"];
    
    */
    
    //You can create a table here
    //[[self getUsingLKDBHelper] createTableWithModelClass:self];
    
 //   [[self getUsingLKDBHelper] createTableWithModelClass:[SystemNotice class]];
 //   [[self getUsingLKDBHelper] createTableWithModelClass:[HomePage class]];

    
}

@end

/*
// 用户信息
@implementation UserInfo

+(NSString *)getPrimaryKey
{
    return @"userid";
}
+(NSString *)getTableName
{
    return @"TUser";
}
+(int)getTableVersion
{
    return 1;
}

@end


// 用户健康档案
@implementation HealthRecords

+(NSString *)getPrimaryKey
{
    return @"userId";
}
+(NSString *)getTableName
{
    return @"THealthRecords";
}
+(int)getTableVersion
{
    return 1;
}

@end



//健康新闻

@implementation HealthArticle

+(NSString *)getPrimaryKey
{
    return @"userid";
}
+(NSString *)getTableName
{
    return @"T";
}
+(int)getTableVersion
{
    return 1;
}

@end

// 系统提醒实体
@implementation SystemNotice


+(NSString *)getPrimaryKey
{
    return @"Id";
}
+(NSString *)getTableName
{
    return @"TNotice";
}
+(int)getTableVersion
{
    return 1;
}

@end


// 主页个人汇总信息实体

@implementation HomePage


+(NSString *)getPrimaryKey
{
    return @"userId";
}
+(NSString *)getTableName
{
    return @"THomePage";
}
+(int)getTableVersion
{
    return 1;
}



@end



*/
