//
//  UserSettingViewController.m
//  KaiHua_App
//


#import "UserSettingViewController.h"
#import <TPKeyboardAvoidingScrollView.h>
#import "UserInfo.h"
#import "NSObject+RuntimeMethods.h"

@interface UserSettingViewController ()<UIGestureRecognizerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>{
   
    int delayTime ;
}

/*User对象*/
@property (nonatomic , strong) UserInfo *userInfo;


@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView_UsetSetingBG;

/* 背景视图*/

@property (weak, nonatomic) IBOutlet UIImageView *img_UserName;

@property (weak, nonatomic) IBOutlet UIImageView *img_UserPhone;

@property (weak, nonatomic) IBOutlet UIImageView *img_UserBirthday;

/*用户头像按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_User_Avator;

/* 用户名*/
@property (weak, nonatomic) IBOutlet UITextField *input_UserName;

/* 手机号*/
@property (weak, nonatomic) IBOutlet UITextField *input_UserPhone;

/* 性别*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Sex_Girl;
@property (weak, nonatomic) IBOutlet UIButton *btn_Sex_Boy;

/* 生日*/
@property (weak, nonatomic) IBOutlet UITextField *input_Birthday_Year;
@property (weak, nonatomic) IBOutlet UITextField *input_Birthday_Month;
@property (weak, nonatomic) IBOutlet UITextField *input_Birthday_Day;


/* 是否结婚*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Marry_NO;
@property (weak, nonatomic) IBOutlet UIButton *btn_MarryYes;

/*文化程度*/
@property (weak, nonatomic) IBOutlet UITextField *input_PersonEducation;

/*职业类型*/
@property (weak, nonatomic) IBOutlet UITextField *input_PersonCareer;



/* 验证码背景输入框*/
@property (weak, nonatomic) IBOutlet UIView *View_Reg_VertifyBG;

/* 验证码*/
@property (weak, nonatomic) IBOutlet UITextField *input_VertifyCode;

/*获取验证码号*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Reg_VertifyCode;


/* 倒计时*/
@property (weak, nonatomic) IBOutlet UILabel *label_Timers;

/* 设置timer 事件*/
@property(retain,nonatomic)NSTimer *timer_Register;


/* 点击手势*/
@property (strong ,nonatomic) UITapGestureRecognizer * tapUserSettingRecognize;


/*确认修改*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Confirm_Edit;

/* 时间选择器视图*/
@property (weak, nonatomic) IBOutlet UIView *view_Datepicker_BG;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePick_Birthday;




@end

@implementation UserSettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_View_Reg_VertifyBG setHidden:YES];
    [_View_Reg_VertifyBG setAlpha:0];
    
    [self.navigationController.navigationBar setBackgroundImage:NavigationBar_UserCent_IMG forBarMetrics:UIBarMetricsDefault];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:NavigationBar_UserCent_IMG forBarMetrics:UIBarMetricsDefault];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_View_Reg_VertifyBG setHidden:YES];


}


- (void)viewDidLoad
{
    [super viewDidLoad];
  
    delayTime = 100;
    // Do any additional setup after loading the view.
    // 自定义左键
    [self customerLeftNavigationBarItemWithTitle:@"取消" andImageRes:nil];
    [self customerRightNavigationBarItemWithTitle:@"完成" andImageRes:nil];
    
    //取消右键
    //[self customerRightNavigationBarItemWithTitle:@"提交" andImageRes:nil];
    
    [self setViewTitle:@"个人信息"];
    
    [self loadViewContentFrame];
    
    // 注册页面点击事件
    _tapUserSettingRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewBgTapEvent:)];
    _tapUserSettingRecognize.delegate = self;
    _tapUserSettingRecognize.numberOfTapsRequired = 1;
    _tapUserSettingRecognize.numberOfTouchesRequired = 1;
    [self.scrollView_UsetSetingBG addGestureRecognizer:_tapUserSettingRecognize];
    
    // 初始化 birthdayView 初始化位置
    [self.view_Datepicker_BG setFrame:CGRectMake(0, Screen_height, Screen_width, self.view_Datepicker_BG.frame.size.height)];
    
    self.datePick_Birthday.maximumDate = [self getNewDataBy:-10 WithCurrentData:[NSDate date]];
    self.datePick_Birthday.minimumDate = [self getNewDataBy:-100 WithCurrentData:[NSDate date]];
    
    //加载用户信息
    [self loadUserInfo];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/* 初始化页面布局*/
-(void) loadViewContentFrame{
    
    [self.img_UserName setImage:IMG_White_Btn_BG];
    [self.img_UserPhone setImage:IMG_White_Btn_BG];
    [self.img_UserBirthday setImage:IMG_White_Btn_BG];
    
    [self.scrollView_UsetSetingBG setFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
    [self.scrollView_UsetSetingBG setContentSize:CGSizeMake(Screen_width, Screen_height - 64)];

    //[self.btn_Confirm_Edit setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateNormal];
   // [self.btn_Confirm_Edit setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateHighlighted];
}


- (void)scrollViewBgTapEvent:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}



#pragma maek - 加载用户信息 -

//加载用户信息
- (void) loadUserInfo
{
    //调用接口获取
    
    /*
     *如果返回为空 return
     *返回不为空 对self.userInfo进行赋值
     */
    
    
    //暂时使用本地数据
    NSDictionary *localDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LocalData" ofType:@"plist"]];
    NSDictionary *userDic = [localDict objectForKey:@"User_Info_Data"];
    
    if (self.userInfo == nil)
    {
        self.userInfo = [UserInfo new];
    }
    else
    {
        self.userInfo = nil;
        self.userInfo = [UserInfo new];
    }
    
    //对user对象进行赋值
    [self.userInfo voluationWithData:userDic];
    
    
    //设置需要显示的信息
    self.input_UserName.text = self.userInfo.personName;
    self.input_UserPhone.text = self.userInfo.userMobilePhone;
    self.input_PersonEducation.text = self.userInfo.personEducation;
    self.input_PersonCareer.text = self.userInfo.personCareer;
    
    //将用户生日分成年月日
    NSArray *birthdayArray = [self.userInfo.personBirthday componentsSeparatedByString:@"-"];
    
    if (birthdayArray != nil && birthdayArray.count == 3)
    {
        self.input_Birthday_Year.text = [NSString stringWithFormat:@"%@ 年",[birthdayArray objectAtIndex:0]];
        self.input_Birthday_Month.text = [NSString stringWithFormat:@"%@ 月",[birthdayArray objectAtIndex:1]];
        self.input_Birthday_Day.text = [NSString stringWithFormat:@"%@ 日",[birthdayArray objectAtIndex:2]];
    }
    
    //设置date picker时间为原数据
    NSDateFormatter *fomatter = [[NSDateFormatter alloc] init];
    [fomatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate new];
    date = [fomatter dateFromString:self.userInfo.personBirthday];
    [self.datePick_Birthday setDate:date animated:NO];
    
    
    //如果是男 设置相应按钮图片
    if ([self.userInfo.personSex isEqualToString:@"0"])
    {
        [self btn_Sex_Boy_Button_Touched];
    }
    else
    {
        [self btn_Sex_Girl_Button_Touched];
    }
    
    //如果是未婚 设置相应按钮图片
    if ([self.userInfo.personMaritalStatus isEqualToString:@"0"])
    {
        [self btn_Marry_NO_Button_Touched];
    }
    else
    {
        [self btn_Marry_YES_Button_Touched];
    }
    
}


#pragma maek - 按钮事件 -

//确认修改
- (IBAction)btn_Confirm_Edit_Button_Touched
{
    //如果需要可以添加验证是否为空  等等
    
    
    
    self.userInfo.personName = self.input_UserName.text;
    self.userInfo.userMobilePhone = self.input_UserPhone.text;
    self.userInfo.personEducation = self.input_PersonEducation.text;
    self.userInfo.personCareer = self.input_PersonCareer.text;
    
    
    /*
     *显示hud提示正在提交
     *调用接口
     *提示提交成功或者失败
     *返回上级界面或者留在此界面
     */
}

//点击用户头像
- (IBAction)btn_User_Avator_Button_Touched
{
    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传", @"相册获取", nil];
    [action setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [action showInView:self.view];
}



//获取验证码按钮
- (IBAction)btn_User_Ico_Button_Touched
{
    if (![[CommonFunc shareInstance] isValidatePhone:_input_UserPhone.text]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入正确的手机号"];
        return;
    }
    /* 验证码倒计时*/
    // 初始化timer 事件
    _timer_Register = nil;
    _timer_Register = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerRepeatEvent) userInfo:nil repeats:YES];
    [self.btn_Reg_VertifyCode setUserInteractionEnabled:NO];
    [_View_Reg_VertifyBG setHidden:NO];
    
    [UIView animateWithDuration:2.0f animations:^{
        
        [_View_Reg_VertifyBG setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [[CommonFunc shareInstance ] showHintMessage:@"验证码已下发至您的手机"];
}

//选择出生年月按钮
- (IBAction)btn_Birthday_Button_Touched
{
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_view_Datepicker_BG setFrame:CGRectMake(0, Screen_height - _view_Datepicker_BG.frame.size.height - 64, Screen_width,_view_Datepicker_BG.frame.size.height )];
        
    } completion:^(BOOL finished) {
        
    }];
}



- (IBAction)btnBirthdayViewCancelEvent:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_view_Datepicker_BG setFrame:CGRectMake(0, Screen_height, Screen_width,_view_Datepicker_BG.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
}


- (IBAction)btn_BirthdayViewOKEvent:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_view_Datepicker_BG setFrame:CGRectMake(0, Screen_height, Screen_width,_view_Datepicker_BG.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    // 取得日期中的年月日
    NSDate *date_Sel = _datePick_Birthday.date;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date_Sel];
    
    int year = [dateComponent year];
    int month = [dateComponent month];
    int day = [dateComponent day];
    
    [_input_Birthday_Year setText:[NSString stringWithFormat:@"%i 年",year]];
    [_input_Birthday_Month setText:[NSString stringWithFormat:@"%i 月",month]];
    [_input_Birthday_Day setText:[NSString stringWithFormat:@"%i 日",day]];
    
    //对用户生日赋值
    NSString *dateString = [NSString stringWithFormat:@"%d-%d-%d",year,month,day];
    self.userInfo.personBirthday = dateString;
}




#pragma mark -

//男 按钮
- (IBAction)btn_Sex_Boy_Button_Touched
{
    [self.btn_Sex_Boy setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_Boy_sel"] forState:UIControlStateNormal];
    [self.btn_Sex_Girl setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_Girl"] forState:UIControlStateNormal];
    
    //设置user对象的性别为男
    self.userInfo.personSex = @"0";
}

//女 按钮
- (IBAction)btn_Sex_Girl_Button_Touched
{
    [self.btn_Sex_Boy setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_Boy"] forState:UIControlStateNormal];
    [self.btn_Sex_Girl setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_Girl_sel"] forState:UIControlStateNormal];
    
    //设置user对象的性别为女
    self.userInfo.personSex = @"1";
}

//未婚 按钮
- (IBAction)btn_Marry_NO_Button_Touched
{
    [self.btn_Marry_NO setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_Nomarry_sel"] forState:UIControlStateNormal];
    [self.btn_MarryYes setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_marry"] forState:UIControlStateNormal];
    
    //设置user对象为未婚
    self.userInfo.personMaritalStatus = @"0";
}

//已婚 按钮
- (IBAction)btn_Marry_YES_Button_Touched
{
    [self.btn_Marry_NO setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_Nomarry"] forState:UIControlStateNormal];
    [self.btn_MarryYes setBackgroundImage:[UIImage imageNamed:@"btn_UserSeting_marry_sel"] forState:UIControlStateNormal];
    
    //设置user对象为已婚
    self.userInfo.personMaritalStatus = @"1";
}


// 倒计时
- (void)timerRepeatEvent{
    
    if (delayTime > 0){
        
        delayTime--;
        
        [self.label_Timers setText:[NSString stringWithFormat:@"%i (S)",delayTime]];
    } else {
        
        [_View_Reg_VertifyBG setHidden:NO];
        [_View_Reg_VertifyBG setAlpha:1];
        [UIView animateWithDuration:2.0f animations:^{
            
            [_View_Reg_VertifyBG setAlpha:0];
        } completion:^(BOOL finished) {
            [_View_Reg_VertifyBG setHidden:YES];
            [_btn_Reg_VertifyCode setUserInteractionEnabled:YES];
            [_btn_Reg_VertifyCode setTitle:@"重新发送" forState:UIControlStateNormal];
            [self.label_Timers setText:@""];
        }];
        
        delayTime = 5;
        [_timer_Register invalidate];
        
    }
    
}


#pragma mark ImagePickerViewDelegate


//压缩图片
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

#pragma mark 保存图片到document
- (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
}


- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissViewControllerAnimated:YES completion:^{
        
    }];
	UIImage *selImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    CGSize sclSize = CGSizeMake(selImage.size.width *0.4, selImage.size.height *0.4);
    // 压缩图片
    UIImage *midImage = [self imageWithImageSimple:selImage scaledToSize:sclSize];
    
    NSString *guid = [[CommonFunc shareInstance] createUUID];
    
    [self saveImage:midImage WithName:[NSString stringWithFormat:@"%@.jpg",guid]];
    
    // doucument 获取文件
    //  NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,                                                                          NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imageUrl = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg",guid]];
    
    NSString *userID = [[[CommonFunc shareInstance] getLocalData:@""] objectForKey:@"id"];
    
    
    
    
}



#pragma UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    
    switch (buttonIndex) {
        case 0: {
            //   //NSLog(@"Item 1 Selected");
            {
                if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
                {
                    picker.sourceType=UIImagePickerControllerSourceTypeCamera;
                }
                else
                {
                    return;
                }
            }
            break;
        }
            
    }
    
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (_view_Datepicker_BG.frame.origin.y != Screen_height)
    {
        [self btnBirthdayViewCancelEvent:nil];
    }
}

@end
