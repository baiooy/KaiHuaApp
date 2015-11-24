//
//  HealthModuleTopCell.h
//  KaiHua_App
//

/*
 *在健康资讯vc顶部暂时的资讯类型cell
 *
 */

#import <UIKit/UIKit.h>
#import "ArticleType.h"

@interface HealthModuleTopCell : UICollectionViewCell

//对应的资讯类型
@property (nonatomic , strong) ArticleType *articleType;

//对应的资讯图片
@property (weak, nonatomic) IBOutlet UIImageView *imv_articleTypeImageView;

@end
