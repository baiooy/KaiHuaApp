//
//  UserRegisterViewController.m
//  KaiHua_App


#import "UserRegisterViewController.h"
#import "NSString+MD5.h"

@interface UserRegisterViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>
{
   int delayTime ;
    NSMutableArray *sexControls;
}

/* 输入框背景视图*/
@property (weak, nonatomic) IBOutlet UIImageView *img_Reg_NameBg;

@property (weak, nonatomic) IBOutlet UIImageView *img_Reg_PwdBg;

@property (weak, nonatomic) IBOutlet UIImageView *img_Reg_PhoneBg;

@property (weak, nonatomic) IBOutlet UIImageView *img_Reg_SexBg;

@property (weak, nonatomic) IBOutlet UIImageView *img_Reg_BirthdayBg;


/* 背景滚动视图*/

@property (weak, nonatomic) IBOutlet UIScrollView *scroll_BGView;

/* 用户姓名*/
@property (weak, nonatomic) IBOutlet UITextField *reg_Name;

/* 密码*/
@property (weak, nonatomic) IBOutlet UITextField *reg_Pwd;

/* 手机号*/
@property (weak, nonatomic) IBOutlet UITextField *reg_Phone;

/* 性别-女*/
@property (weak, nonatomic) IBOutlet UIButton *reg_Btn_Girl;

/* 性别-男*/
@property (weak, nonatomic) IBOutlet UIButton *reg_Btn_Boy;

/* 生日 -年*/
@property (weak, nonatomic) IBOutlet UITextField *reg_Birthday_Year;

/* 生日 -月*/
@property (weak, nonatomic) IBOutlet UITextField *reg_Birthday_Month;

/* 生日 -日*/
@property (weak, nonatomic) IBOutlet UITextField *reg_Birthday_Day;

/* 完成注册按钮*/
@property (weak, nonatomic) IBOutlet UIButton *reg_Btn_Commit;

/* 获取验证码*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Reg_VertifyCode;

/* 验证码背景输入框*/
@property (weak, nonatomic) IBOutlet UIView *View_Reg_VertifyBG;

/* 验证码*/
@property (weak, nonatomic) IBOutlet UITextField *input_VertifyCode;

/* 倒计时*/
@property (weak, nonatomic) IBOutlet UILabel *label_Timers;


/* 点击手势*/
@property (strong ,nonatomic) UITapGestureRecognizer * tapRegisterRecognize;

/* 设置timer 事件*/
@property(retain,nonatomic)NSTimer *timer_Register;


/* 时间选择器视图*/
@property (weak, nonatomic) IBOutlet UIView *view_Datepicker_BG;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePick_Birthday;






@end

@implementation UserRegisterViewController

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
    
    [_View_Reg_VertifyBG setHidden:NO];
    [_View_Reg_VertifyBG setAlpha:1];
    
}

-(void)viewDidDisappear:(BOOL)animated{
     [_View_Reg_VertifyBG setHidden:YES];
    
    [super viewDidAppear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //隐藏navigationbar下面的黑线
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                imageView.hidden=YES;
            }
        }
    }
    
    [self setViewTitle:@"注 册"];
    [self loadViewContentFrame];
    delayTime = 60;
    
    // 注册页面点击事件
    _tapRegisterRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollBgViewTapEvent:)];
    _tapRegisterRecognize.delegate = self;
    _tapRegisterRecognize.numberOfTapsRequired = 1;
    _tapRegisterRecognize.numberOfTouchesRequired = 1;
    [self.scroll_BGView addGestureRecognizer:_tapRegisterRecognize];
    
    [self.scroll_BGView setContentSize:CGSizeMake(Screen_width, Screen_height - 64)];
    
    [self initViewControls];
    
    
//    // 注册键盘监听方法
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regViewKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(regViewKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//    
   
    // 初始化 birthdayView 初始化位置
    [self.view_Datepicker_BG setFrame:CGRectMake(0, Screen_height, Screen_width, self.view_Datepicker_BG.frame.size.height)];
    
    self.datePick_Birthday.maximumDate = [self getNewDataBy:-10 WithCurrentData:[NSDate date]];
    self.datePick_Birthday.minimumDate = [self getNewDataBy:-100 WithCurrentData:[NSDate date]];
    
    
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
        
        delayTime = 60;
        [_timer_Register invalidate];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)scrollBgViewTapEvent:(UITapGestureRecognizer *)sender{
   
    [self.reg_Name resignFirstResponder];
    [self.reg_Phone resignFirstResponder];
    [self.reg_Pwd resignFirstResponder];
    [self.input_VertifyCode resignFirstResponder];
    
}

/*

-(void) regViewKeyboardWillShow:(NSNotification *)sender{
    
     NSDictionary *info = [sender userInfo];
   
     CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
   
     CGFloat playTime = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
     [UIView animateWithDuration:playTime animations:^{
         
         [self.scroll_BGView setFrame:CGRectMake(0, 0, Screen_width, Screen_height - kbSize.height)];
         
     } completion:^(BOOL finished) {
         
     }];
    
    
    
}


-(void) regViewKeyboardWillHide:(NSNotification *)sender{
   
     NSDictionary *info = [sender userInfo];
   
    //  CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
   
      CGFloat playTime = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
   
     [UIView animateWithDuration:playTime animations:^{
         
         [self.scroll_BGView setFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
         
     } completion:^(BOOL finished) {
        
     }];
    
    
    
}

 */

/* 初始化页面布局*/
-(void) loadViewContentFrame{
    
    [self.img_Reg_NameBg setImage:IMG_InputView_BG];
    [self.img_Reg_PwdBg setImage:IMG_InputView_BG];
    [self.img_Reg_PhoneBg setImage:IMG_InputView_BG];
    [self.img_Reg_SexBg setImage:IMG_InputView_BG];
    [self.img_Reg_BirthdayBg setImage:IMG_InputView_BG];
    [self.reg_Btn_Commit setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateNormal];
    [self.reg_Btn_Commit setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateHighlighted];
}

/* 设置按钮状态*/
-(void)initViewControls{
    [_reg_Btn_Boy setImage:[UIImage imageNamed:@"login_bor"] forState:UIControlStateSelected];
    [_reg_Btn_Girl setImage:[UIImage imageNamed:@"login_girl"] forState:UIControlStateSelected];
    
    sexControls = [NSMutableArray array];
    [sexControls addObject:_reg_Btn_Girl];
    [sexControls addObject:_reg_Btn_Boy];
}


#pragma mark -- 获取验证码
- (IBAction)btn_GetVertifyCodeEvent:(id)sender {

    if (![[CommonFunc shareInstance] isValidatePhone:_reg_Phone.text]){
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

#pragma mark -- 性别按钮事件
- (IBAction)btn_Girl_Event:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    void (^changeBtnState)(NSMutableArray *) = ^(NSMutableArray *array){
        
        for (NSObject *obj in array) {
            UIButton *btn = (UIButton *)obj;
            if(btn.selected == YES){
                btn.selected = NO;
                btn.tag = 0;
            }
        }
        
    };
    
    changeBtnState(sexControls);
    
    if (btn.tag == 0){
        [btn setSelected:YES];
        [btn setTag:1];
    } else {
        [btn setTag:0];
        [btn setSelected:NO];

    }
    
}

- (IBAction)btn_Boy_Event:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 0){
        [btn setSelected:YES];
        [btn setTag:1];
    } else {
        [btn setTag:0];
        [btn setSelected:NO];
        
    }
}


#pragma mark -- 选择生日
- (IBAction)btn_BirthdayEvent:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_view_Datepicker_BG setFrame:CGRectMake(0, Screen_height - _view_Datepicker_BG.frame.size.height, Screen_width,_view_Datepicker_BG.frame.size.height )];
        
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
    
    [_reg_Birthday_Year setText:[NSString stringWithFormat:@"%i 年",year]];
    [_reg_Birthday_Month setText:[NSString stringWithFormat:@"%i 月",month]];
    [_reg_Birthday_Day setText:[NSString stringWithFormat:@"%i 日",day]];
    
    
}


#pragma mark -- 上传头像
- (IBAction)btn_UserIcoEvent:(id)sender {
    
    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照上传", @"相册获取", nil];
    [action setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [action showInView:self.view];

    
}


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

#pragma mark ImagePickerViewDelegate

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



#pragma mark -- 注册提交事件


- (BOOL)checkDataBeforeCommit{
    if ([self.reg_Name.text isEqualToString:@""]){
        
        [UIAlertView showAlertViewWithTitle:@"提示" message:@"请输入用户名" cancelButtonTitle:nil otherButtonTitles:[NSArray arrayWithObject:@"确定"] onDismiss:^(int buttonIndex) {
            
        } onCancel:^{
            
        }];
        
        return NO;
    }
    
    if ([self.reg_Phone.text isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入手机号"];
        return NO;
    }
    if ([self.reg_Pwd.text isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入密码"];
        return NO;
    }
    
    if (!self.reg_Btn_Boy.selected && !self.reg_Btn_Girl.selected){
        [[CommonFunc shareInstance] showHintMessage:@"请选择您的性别"];
        return NO;
    }
    
    if ([self.reg_Birthday_Month.text isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"请选择生日"];
        return NO;
    }
    
    if (![[CommonFunc shareInstance] isValidatePhone:_reg_Phone.text]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入正确的手机号"];
        return NO;
    }
    
    return YES;
}

/* 获得当前的性别*/
-(NSString *)getUserSex{
  
    NSString *sex_Str = @"";
    
    if (_reg_Btn_Boy.selected) sex_Str = @"1";
    if (_reg_Btn_Girl.selected) sex_Str = @"2";
   
    return sex_Str;
}

/* 出生日期*/
-(NSString *)getRegDate{
    
    NSString *reg_Date = @"";
    
    reg_Date = [NSString stringWithFormat:@"%@-%@-%@",_reg_Birthday_Year.text,_reg_Birthday_Month.text,_reg_Birthday_Day.text];

    return reg_Date;
}




- (IBAction)btn_CommitEvent:(id)sender {
    
//    if ([self checkDataBeforeCommit]) {
//        // 调用接口 执行登陆验证操作
//        
//        NSString *md5Str = _reg_Pwd.text;
//        md5Str = [md5Str MD5Digest];
//        NSDictionary *condation = @{@"personSex":[self getUserSex],@"personBirthday":[self getRegDate],@"password":md5Str,@"headSculpture":@"",@"verificationCode":_input_VertifyCode.text,@"deviceToken":@""};
//        
//        NSDictionary *signDict = @{@"personName":_reg_Name.text,@"userMobilePhone":_reg_Phone.text};
//        
//        NSDictionary *postDict = [[Project_Func shareInstance] makePostParamsWithCondation:condation AndSignDict:signDict];
//        
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//        
//        [manager POST:FUN_USER_REGISTER parameters:postDict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            
//            [formData appendPartWithFormData:nil name:@"image"];
//            
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            
//            NSLog(@"JSON: %@", responseObject);
//            if (responseObject){
//                
//                NSArray* list  = [responseObject objectForKey:@"data"];
//                NSLog(@"admin Data is %@",[list objectAtIndex:0]);
//                
//                
//            }else {
//                
//                
//            }
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//            NSLog(@"Error: %@", error);
//        }];
//    
//     
//    
//    }
    
}






@end
