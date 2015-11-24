//
//  ResetPwdViewController.m
//  KaiHua_App
//

#import "ResetPwdViewController.h"
#import "CommonFunc.h"
#import "NSString+MD5.h"

@interface ResetPwdViewController ()<UIGestureRecognizerDelegate>
{
     int delayTime ;
}
/* 输入框背景视图*/
@property (weak, nonatomic) IBOutlet UIImageView *img_Resert_Phone;

@property (weak, nonatomic) IBOutlet UIImageView *img_Resert_Pwd;

@property (weak, nonatomic) IBOutlet UIImageView *img_Resert_CK_Pwd;

@property (weak, nonatomic) IBOutlet UIImageView *img_Resert_Vertify;



/* 获取验证码*/
@property (weak, nonatomic) IBOutlet UIButton *btn_VertifyCode;

/* 倒计时*/
@property (weak, nonatomic) IBOutlet UILabel *Label_Times;

/* 用户手机号*/
@property (weak, nonatomic) IBOutlet UITextField *input_Phone;

/* 密码*/
@property (weak, nonatomic) IBOutlet UITextField *input_Pwd;

/* 验证密码*/
@property (weak, nonatomic) IBOutlet UITextField *input_CKPwd;

/* 验证码*/
@property (weak, nonatomic) IBOutlet UITextField *input_VertifyCode;


/* 提交*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Commite;

/* 点击手势*/
@property (strong ,nonatomic) UITapGestureRecognizer * tapRestPwdRecognize;

/* 设置timer 事件*/
@property(retain,nonatomic)NSTimer *timer;


@end

@implementation ResetPwdViewController

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
    
    [self setViewTitle:@"找回密码"];
    
    delayTime = 60;
    [self loadViewContentFrame];
    
    // 注册页面点击事件
    _tapRestPwdRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resertPwdViewTapEvent:)];
    _tapRestPwdRecognize.delegate = self;
    _tapRestPwdRecognize.numberOfTapsRequired = 1;
    _tapRestPwdRecognize.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:_tapRestPwdRecognize];
    
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

-(void)resertPwdViewTapEvent:(UITapGestureRecognizer *)sender{
     [_input_CKPwd resignFirstResponder];
     [_input_Phone resignFirstResponder];
     [_input_Pwd resignFirstResponder];
     [_input_VertifyCode resignFirstResponder];

}


/* 初始化页面布局*/
-(void) loadViewContentFrame{
    
    [self.img_Resert_Phone setImage:IMG_InputView_BG];
    [self.img_Resert_Pwd setImage:IMG_InputView_BG];
    [self.img_Resert_CK_Pwd setImage:IMG_InputView_BG];
    [self.img_Resert_Vertify setImage:IMG_InputView_BG];
    [self.btn_Commite setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateNormal];
    [self.btn_Commite setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateHighlighted];
}


#pragma mark -- 获取验证码事件
- (IBAction)btn_VertifyCodeEvent:(id)sender {
    
    if (![[CommonFunc shareInstance] isValidatePhone:_input_Phone.text]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入正确的手机号"];
        return;
    }
    
    #pragma mark -- 暂时写上，稍后再连调试
    /* 再次调用 获取验证码接口*/
    NSString *md5Str = _input_Pwd.text;
    md5Str = [md5Str MD5Digest];
    
    NSDictionary *signDict = @{@"userMobilePhone":_input_Phone.text,};
    
    NSDictionary *postDict = [[Project_Func shareInstance] makePostParamsWithCondation:nil AndSignDict:signDict];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:FUN_USER_VERIFICATION_CODE parameters:postDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if (responseObject){
            
            NSArray* list  = [responseObject objectForKey:@"data"];
            NSLog(@"admin Data is %@",[list objectAtIndex:0]);
            
            
        }else {
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

    
      /* 验证码倒计时*/
     // 初始化timer 事件
      _timer = nil;
      _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(aliftReverificBtn) userInfo:nil repeats:YES];
      [self.btn_VertifyCode setUserInteractionEnabled:NO];
    
      [[CommonFunc shareInstance ] showHintMessage:@"验证码已下发至您的手机"];
    
}

// 倒计时
- (void)aliftReverificBtn{
    
    if (delayTime > 0){
        
        delayTime--;
        
        [self.Label_Times setText:[NSString stringWithFormat:@"%i (S)",delayTime]];
    } else {
        [self.btn_VertifyCode setUserInteractionEnabled:YES];
        delayTime = 60;
        [_timer invalidate];
        [self.btn_VertifyCode setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.Label_Times setText:@""];
    }
}

#pragma mark -- 完成按钮事件
- (BOOL)checkDataBeforeCommit{
    if ([self.input_Phone.text isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入手机号"];
        return NO;
    }
    
    if ([self.input_Pwd.text isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入密码"];
        return NO;
    }
    
    if ([self.input_Pwd.text isEqualToString:self.input_CKPwd.text]){
        [[CommonFunc shareInstance] showHintMessage:@"密码不一致"];
        return NO;
    }
    
    return YES;
}


- (IBAction)BtnComplateEvent:(id)sender {
    
    [self resertPwdViewTapEvent:nil];
    
    if ([self checkDataBeforeCommit]) {
      
      /* 在此调用修改面接口*/
#pragma mark -- 暂时写上，稍后再连调试
        
        NSString *md5Str = _input_Pwd.text;
        md5Str = [md5Str MD5Digest];
        NSDictionary *condation = @{@"verificationCode":_input_VertifyCode.text,@"newPwd":md5Str};
        
        NSDictionary *signDict = @{@"userId":_input_Phone.text,@"phone":_input_Phone.text};
        
        NSDictionary *postDict = [[Project_Func shareInstance] makePostParamsWithCondation:condation AndSignDict:signDict];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager POST:FUN_USER_FORGOT_PWD parameters:postDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            if (responseObject){
                
                NSArray* list  = [responseObject objectForKey:@"data"];
                NSLog(@"admin Data is %@",[list objectAtIndex:0]);
                
                
            }else {
                
                
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
        }];

        
    }
    
}


@end
