//
//  ViewController.h
//  KaiHua_App
//


#import <UIKit/UIKit.h>
#import "Constant.h"
#import "UIAlertView+Blocks.h"
#import <AFNetworking.h>
#import "Project_Func.h"
#import "CommonFunc.h"
#import "FormatData.h"
#import "DataModule.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) AFHTTPRequestOperationManager *httpManager;

// 设置Navigation bar title
-(void) setViewTitle:(NSString *)title;

// 日期加减
-(NSDate *)getNewDataBy:(int)year WithCurrentData:(NSDate *)data;

/*-- ios7 动态计算UITextView 内容的高度*/
-(CGFloat)getControlHWithTextView:(UITextView *)textView attributes:(NSDictionary *)attributes;



// 显示加载信息动画
-(void) showLoadingView;

// 隐藏 加载动画
-(void) hideLoadingView;

// 提醒消息
-(void)showHintMessage:(NSString*)mesage;


// 登陆提示消息
-(void)showLoginMessage:(NSString*)mesage;


// 登陆提示消息
-(void)hideViewMessage;


@end
