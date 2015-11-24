//
//  DatabaseOption.h
//  
//  数据库的读写操作
//
//  AppDelegate.h
//  ShouGouAPP
//
//  Created by yczx on 13-3-25.
//  Copyright (c) 2013年 yczx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDatabase.h>
#import "Constant.h"

#define ODB_DATABASE_SQLITE_VERSION 3
#define ODB_DATABASE_NAME @"health.db"
#define ODB_DATABASE_FULL_PATH [ODB_APP_DOC_PATH stringByAppendingPathComponent:ODB_DATABASE_NAME]


@interface DatabaseOption : NSObject
{
    FMDatabase *_fmdb;

}

@property (nonatomic,strong) FMDatabase *fmdb;

/*打开数据库*/
- (BOOL)openDatabase;
/*关闭数据库*/
- (BOOL)closeDatabase;



@end
