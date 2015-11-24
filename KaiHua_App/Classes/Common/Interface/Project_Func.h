//
//  ReseriveDataFromServer.h
//  KaiHua_InterfaceTest
//
//  Created by lx on 14-6-20.
//  Copyright (c) 2014年 Amsante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project_Func : NSObject


// APP 版本号
@property(nonatomic,strong) NSString *appVersion;

// APP Secrect
@property(nonatomic,strong) NSString *appSecrect;



+ (Project_Func *)shareInstance;


// 生成POST请求参数
-(NSDictionary *) makePostParamsWithCondation:(NSDictionary *)dict AndSignDict:(NSDictionary *)signDict;


@end
