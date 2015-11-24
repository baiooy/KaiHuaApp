//
//  ArticleType.m
//  KaiHua_App
//
//  Created by dd on 14-7-9.
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "ArticleType.h"

@implementation ArticleType

+(void)initialize
{
    [[self getUsingLKDBHelper]createTableWithModelClass:self];
}


+(NSString *)getPrimaryKey
{
    return @"typeId";
}
+(NSString *)getTableName
{
    return @"TArticleType";
}
+(int)getTableVersion
{
    return 1;
}

@end
