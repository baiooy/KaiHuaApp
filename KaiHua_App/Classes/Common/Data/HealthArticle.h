//
//  HealthArticle.h
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "BaseModule.h"

/*
 *健康新闻
 */

@interface HealthArticle :BaseModule

@property (nonatomic , copy) NSString *articleID;   //资讯内容ID
@property (nonatomic , copy) NSString *content;     //资讯内容
@property (nonatomic , copy) NSString *pictureId;   //图片ID


@property (nonatomic , copy) NSString *typeID;      //资讯类型ID
@property (nonatomic , copy) NSString *title;       //标题
@property (nonatomic , copy) NSString *from;        //来源
@property (nonatomic , copy) NSString *createTime;  //创建时间
@end
