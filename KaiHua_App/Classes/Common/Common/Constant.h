
//  CommonConstant.h

#import "ContInterface.h"

// 表单API密钥
#define UPYUN_PASSCODE @"fXzAaIE7Bp3s6hF+vsEV/JNfOnU="


/********************************数据请求部分的常量****************************************/
#pragma mark-- 服务器地址
/*服务器地址*/
#define SERVER_IP @"2222218.80.0.97:8081"//192.168.1.10"////10.0.0.100//cy-soft.com//180.153.225.174:8080
// 应用名 
#define APP_NAME @"kaihua-hms-web"//
// 接口服务目录
#define INTERFACE_NAME @"ws/v1"//
//
#define MODUL_FILE @"user/"//


#define APP_DOCUMENT @"upload/document"//

#define SERVER_ADDRESS [NSString stringWithFormat:@"http:sss//%@/%@/%@",SERVER_IP,APP_NAME,INTERFACE_NAME]
#define INTERFACE_ADDRESS [NSString stringWithFormat:@"http:sss//%@/%@/%@/%@",SERVER_IP,APP_NAME,INTERFACE_NAME,MODUL_FILE]

// 文件服务器路径
#define SERVER_DOCUMENT [NSString stringWithFormat:@"http:sss//%@/%@/%@/%@",SERVER_IP,APP_NAME,INTERFACE_NAME,APP_DOCUMENT]
#define SERVER_IMAGEPATH [NSString stringWithFormat:@"http:sss//%@/%@",SERVER_IP,APP_NAME]



/* ----------------------------------------定义版本------------------------------------------*/
#pragma mark--APP接口加密模块
#define SECRECT  @"a2FpaHVhLWhlYWx0aA=="
#define VERSION  @"1"


#define APP_VERSION  @"VERSION"
#define APP_SECRECT  @"SECRECT"
#define APP_SIGN  @"signature"
#define APP_TIMESTAMP  @"TIMESTAMP"


/*---------------------------------工程全局变量宏定义-----------------------------------*/
#define VIEW_TYPE_QA 0
#define VIEW_TYPE_RESERVATION 1
//通知中心切换视图
#define CHANGE_SCENCE @"changeScene"



/*---------------------------------接口返回字段定义-----------------------------------*/
#pragma mark--接口返回值
// 返回JSON数据的KEY
#define MESSAGE @"error"
#define CHECK_RESULT @"code"
#define RETURN_USER_DATA @"user_data"
#define CENTER_DATA @"center_data"


#pragma mark--其他宏定义
// 消息相关
#define ALERT_TITLE_ERROR @"出错提示"
#define ALERT_TITLE_HINT @"提 示"
#define ALERT_BUTTON_CONFIRM @"确定"
#define ALERT_BUTTON_CANCEL @"确定"
#define LOADINGDATAERROR @"数据加载为空，请重试"
#define NETCONNECTERROR  @"网络连接有误，请检查网络是否已连接"
//PushTableView相关的配置信息

#define PageSize 20

#define LoadingStatus @"正在加载中..."
#define LoadingDone @""




/********************************其它*********************************/
#pragma mark--宏方法定义
// Slide 菜单选中颜色
#define SlideMenu_Color [UIColor colorWithRed:64/255.0 green:253/255.0 blue:254/255.0 alpha:1]


//UINavigationBar 背景颜色定义
#define NavigationBar_UserCent_IMG [UIImage imageNamed:@"nav_Bar_UserCent_BG"]
#define NavigationBar_Blue_Color [UIColor colorWithRed:45/255.0 green:128/255.0 blue:249/255.0 alpha:1]
#define NavigationBar_QA_IMG [UIImage imageNamed:@"nav_QA_Bar_BG"]
#define NavigationBar_ReserVation_IMG [UIImage imageNamed:@"nav_Reservation_Bar_BG"]
#define NavigationBar_HealthService_IMG [UIImage imageNamed:@"nav_HealthService_Bar_BG"]
#define NavigationBar_HomePage_IMG [UIImage imageNamed:@"nav_Bar_homepage_BG"]



#define NavigationBar_Blue_Color [UIColor colorWithRed:45/255.0 green:128/255.0 blue:249/255.0 alpha:1]
#define NavigationBar_QA_Color [UIColor colorWithRed:84/225.0 green:95/225.0 blue:244/225.0 alpha:1]
#define NavigationBar_ReserVation_Color [UIColor colorWithRed:37/225.0 green:124/225.0 blue:254/225.0 alpha:1]
#define NavigationBar_HealthService_Color [UIColor colorWithRed:103/225.0 green:84/225.0 blue:244/225.0 alpha:1]



/*本地保存到NSDocumentDirectory的路径*/
#define ODB_APP_DOC_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/* NavigationBar tint颜色*/
#define NavigationBar_TintColor [UIColor colorWithRed:73/255.0 green:189/255.0 blue:204/255.0 alpha:1]
//#define 

#define IMG_InputView_BG ([[UIImage imageNamed:@"img_login_inputBG"]stretchableImageWithLeftCapWidth:25 topCapHeight:0])

#define IMG_White_Btn_BG [[UIImage imageNamed:@"btn_Login"] stretchableImageWithLeftCapWidth:25 topCapHeight:0]

#define IMG_BLUE_Btn_BG [[UIImage imageNamed:@"btn_Register"] stretchableImageWithLeftCapWidth:25 topCapHeight:0]

#define IMG_ZISE_Btn_BG [[UIImage imageNamed:@"btn_Common_ZiSe"] stretchableImageWithLeftCapWidth:25 topCapHeight:0]

#define IMG_ZISE_ASK_Now_Btn_BG [[UIImage imageNamed:@"btn_Common_ASKNow"] stretchableImageWithLeftCapWidth:25 topCapHeight:0]

#define IMG_GREY_Btn_BG [[UIImage imageNamed:@"btn_Common_disable"] stretchableImageWithLeftCapWidth:25 topCapHeight:0]

#define IMG_Btn_Doctorinfo_Blue_BG [[UIImage imageNamed:@"img_Btn_Blue_DoctorInfo"] stretchableImageWithLeftCapWidth:32 topCapHeight:0]

#define IMG_Btn_Doctorinfo_Zise_BG [[UIImage imageNamed:@"img_Btn_ZiSe_DoctorInfo"] stretchableImageWithLeftCapWidth:32 topCapHeight:0]


// APP 字体文件定义


#define FontViewTitle(fontSize) [UIFont fontWithName:@"FZLTCHJW--GB1-0" size:fontSize]
#define FontOthers_CH(fontSize) [UIFont fontWithName:@"FZLTHJW--GB1-0" size:fontSize]
#define FontOthers_Number(fontSize) [UIFont fontWithName:@"DINAlternate-Bold" size:fontSize]




/*本地保存到NSDocumentDirectory的路径*/
#define ODB_APP_DOC_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// 获取屏幕宽度
#define Screen_height   [[UIScreen mainScreen] bounds].size.height
#define Screen_width    [[UIScreen mainScreen] bounds].size.width

// 判断设备是否是iphone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)



