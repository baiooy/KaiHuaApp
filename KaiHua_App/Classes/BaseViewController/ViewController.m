//
//  ViewController.m
//  KaiHua_App
//

#import "ViewController.h"
#import "HLoadingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithRed:242.0/255 green:242.0/255 blue:242.0/255 alpha:1]];

    _httpManager = [[AFHTTPRequestOperationManager alloc] init];
    // 设置请求类型
    _httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 设置Navigation bar title
-(void) setViewTitle:(NSString *)title
{
    // self.navigationItem.title = title;
    UIView *viewTitle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    viewTitle.backgroundColor = [UIColor clearColor];
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 190, 40)];
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.text = title;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.textColor = [UIColor whiteColor];
    lblTitle.font = FontOthers_CH(18);
    [viewTitle addSubview:lblTitle];
    self.navigationItem.titleView = viewTitle;
    
}

// 日期加减函数
-(NSDate *)getNewDataBy:(int)year WithCurrentData:(NSDate *)data
{
    NSDate *valentinesDay = [NSDate date];
    NSLog(@"Valentine's Day = %@", valentinesDay);
    NSDateComponents *weekBeforeDateComponents = [[NSDateComponents
                                                   alloc] init];
    weekBeforeDateComponents.year = year;
    NSDate *vDayShoppingDay = [[NSCalendar currentCalendar]
                               dateByAddingComponents:weekBeforeDateComponents
                               toDate:valentinesDay
                               options:0];
    
    return vDayShoppingDay;
}


/* ios7 动态计算UITextView 内容的高度*/
-(CGFloat)getControlHWithTextView:(UITextView *)textView attributes:(NSDictionary *)attributes
{
    CGFloat textViewH;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        
        CGRect txtFrame = textView.frame;
        textViewH = txtFrame.size.height =[[NSString stringWithFormat:@"%@\n ",textView.text] boundingRectWithSize:CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                                                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading                           attributes:attributes
                                                                                                           context:nil].size.height;
    }else{
        textViewH = textView.contentSize.height;
    }
    
    return textViewH;
}


// 加载 状态状态栏显示
// 显示加载信息动画
-(void) showLoadingView
{
    [HLoadingView showDefaultLoadingView];
}

// 隐藏 加载动画
-(void) hideLoadingView
{
    [HLoadingView hideWithAnimated:YES];
}

// 提醒消息
-(void)showHintMessage:(NSString*)mesage
{
    [HLoadingView showInView:self.view image:nil info:mesage animated:YES modeled:YES autoHide:YES];
}

// 登陆提示消息
-(void)showLoginMessage:(NSString*)mesage
{
    [HLoadingView showInView:self.view image:nil info:mesage animated:YES modeled:YES autoHide:NO];
}


// 隐藏提示消息
-(void)hideViewMessage
{
    [HLoadingView hideWithAnimated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
