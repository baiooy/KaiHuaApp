//
//  HealthArticle.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "HealthArticle.h"

@implementation HealthArticle


+(void)initialize
{
    [[self getUsingLKDBHelper]createTableWithModelClass:self];
}

+(NSString *)getPrimaryKey
{
    return @"articleID";
}
+(NSString *)getTableName
{
    return @"THealthArticle";
}
+(int)getTableVersion
{
    return 1;
}


@end
