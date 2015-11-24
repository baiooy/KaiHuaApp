//
//  HealthRecords.m
//  KaiHua_App

//

#import "HealthRecords.h"

@implementation HealthRecords

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
    return @"THealthRecords";
}
+(int)getTableVersion
{
    return 1;
}

@end
