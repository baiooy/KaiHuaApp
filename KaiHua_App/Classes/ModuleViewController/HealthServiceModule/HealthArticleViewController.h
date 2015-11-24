//
//  HealthArticleViewController.h
//  KaiHua_App

//

/*
 *资讯详细页面
 *
 */

#import "BaseViewController.h"
#import "HealthArticle.h"


@interface HealthArticleViewController : BaseViewController


/* 单签文章列表*/
@property(nonatomic,weak) NSArray *articleList;

/* 单签文章索引*/
@property(nonatomic,assign) int articleIndex;


@end
