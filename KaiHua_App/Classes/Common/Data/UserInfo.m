//
//  UserInfo.m
//  KaiHua_App


#import "UserInfo.h"

@implementation UserInfo


//在类 初始化的时候
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
    return @"TUser";
}
+(int)getTableVersion
{
    return 1;
}



@end
