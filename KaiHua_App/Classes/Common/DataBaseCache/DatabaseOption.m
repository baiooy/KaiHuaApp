//
//  DatabaseOption.m
//  
//
//  AppDelegate.h
//  ShouGouAPP
//
//  Created by yczx on 13-3-25.
//  Copyright (c) 2013年 yczx. All rights reserved.
//

#import "DatabaseOption.h"
#import <FMResultSet.h>

@implementation DatabaseOption
@synthesize fmdb = _fmdb;



- (void)dealloc
{
    [_fmdb release];
    [super dealloc];
}

- (id)init
{
    if (self)
    {     
        self.fmdb = [FMDatabase databaseWithPath:ODB_DATABASE_FULL_PATH];
        if (![self.fmdb open]) {
        //    NSLog(@"Could not open db.");
            return self;
        }
        //开启缓存
        [self.fmdb setShouldCacheStatements:YES];
    }
    return self;

}

+ (void)initialize
{
    //将文件拷贝到应用程序沙箱中
    NSFileManager * fileMan = [NSFileManager defaultManager];
    if (![fileMan fileExistsAtPath:ODB_DATABASE_FULL_PATH]) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"health" ofType:@"db"];
        
       // NSLog(@"#####%@", path);
        NSData * database = [NSData dataWithContentsOfFile:path];
        [database writeToFile:ODB_DATABASE_FULL_PATH atomically:YES];
    }
    
}

- (BOOL)closeDatabase
{
    if ([self.fmdb close]) {
        return YES;
    }else {
        return NO;
    }
}

- (BOOL)openDatabase
{
    if ([self.fmdb open]) {
        return YES;
    }else {
        return NO;
    }
}




@end
