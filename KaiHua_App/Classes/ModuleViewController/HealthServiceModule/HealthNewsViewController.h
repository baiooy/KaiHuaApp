//
//  HealthNewsViewController.h
//  KaiHua_App

//

/*
 *健康资讯
 *
 */


/*
 *初始化方式 
 *如果从推荐列表进入
 *不显示顶部的资讯类型列表
 *右上角显示订阅按钮
*/
typedef enum
{
    InitTypeList,       //从首页列表进入
    InitTypeCommend     //从推送消息进入
}InitType;


#import "BaseViewController.h"
#import "ArticleType.h"

@interface HealthNewsViewController : BaseViewController

//当前资讯类型
@property (nonatomic , strong) ArticleType *articleType;

//资讯列表  可以从接口获取 也可以由上级界面直接赋值
@property (nonatomic , strong) NSMutableArray *arr_newsTypesArray;

//如果不赋值  默认为从首页资讯列表进入 即:InitTypeList
@property (nonatomic , assign) InitType type;

@end
