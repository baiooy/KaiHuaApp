//
//  HealthArticleCell.h
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

/*
 *健康资讯vc中显示的瀑布流cell
 *
 */

#import "TMQuiltViewCell.h"
#import "HealthArticle.h"


@interface HealthArticleCell : TMQuiltViewCell

@property (nonatomic , strong) HealthArticle *healthArticle;

/*
 *对cell进行赋值和初始化
 *如果调用此方法 就不必对self.healthArticle赋值
 *且强烈建议调用此方法初始化cell
 *返回值为cell当前的高度
 */
- (CGFloat) layoutSubviewsWithHealthArticle:(HealthArticle *)healthArticle;

@end
