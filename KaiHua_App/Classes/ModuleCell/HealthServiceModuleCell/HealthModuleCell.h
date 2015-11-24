//
//  HealthModuleCell.h
//  KaiHua_App

//

/*
 *展示健康资讯的类型cell
 *
 */

#import <UIKit/UIKit.h>
#import "ArticleType.h"

@interface HealthModuleCell : UICollectionViewCell


//对应的资讯类型
@property (nonatomic , strong) ArticleType *articleType;

//对应的资讯图片
@property (weak, nonatomic) IBOutlet UIImageView *imv_articleTypeImageView;

-(void)setCellData:(NSDictionary *)dict;


@end
