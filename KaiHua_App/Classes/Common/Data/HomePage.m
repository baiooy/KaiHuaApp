//
//  HomePage.m
//  KaiHua_App
//

//

#import "HomePage.h"

@implementation HomePage

// 主页个人汇总信息实体

+(void)initialize
{
    [[self getUsingLKDBHelper]createTableWithModelClass:self];
}

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
