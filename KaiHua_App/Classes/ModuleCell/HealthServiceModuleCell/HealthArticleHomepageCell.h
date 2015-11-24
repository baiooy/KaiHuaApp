//
//  HealthArticleHomepageCell.h
//  KaiHua_App

//

/*
 *健康资讯在首页显示时使用的cell
 *
 */

#import <UIKit/UIKit.h>
#import "HealthArticle.h"

@interface HealthArticleHomepageCell : UICollectionViewCell

//对应的健康资讯对象
@property (nonatomic , strong) HealthArticle *healthArticle;

//资讯图片
@property (weak, nonatomic) IBOutlet UIImageView *imv_arcitleImage;


-(void)setCellData:(NSDictionary *)dict;

@end
