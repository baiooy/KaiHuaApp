//
//  UserloginViewController.m
//  KaiHua_App


#import "UserloginViewController.h"
#import "CommonFunc.h"
#import "JDMenuViewController.h"
#import "AppDelegate.h"
#import "Project_Func.h"
#import "NSString+MD5.h"
#import "UserInfo.h"


@interface UserloginViewController ()<UIGestureRecognizerDelegate,UIActionSheetDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *user_Ico;

/* 输入框背景View*/
@property (weak, nonatomic) IBOutlet UIView *view_InputBG;

/* 输入框背景视图*/
@property (weak, nonatomic) IBOutlet UIImageView *img_userPhone_BG;
@property (weak, nonatomic) IBOutlet UIImageView *img_userPwd_BG;
@property (weak, nonatomic) IBOutlet UITextField *user_Phone;
@property (weak, nonatomic) IBOutlet UITextField *user_Pwd;

/* 重置密码按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_ResertPwd;

/* 登陆按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Login;

/* 微信登陆按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_WechatLogin;

/* QQ按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_QQLogin;

/* 注册按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Register;


/* 点击手势*/
@property (strong ,nonatomic) UITapGestureRecognizer * tapRecognize;


@end

@implementation UserloginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadViewContentBG];
    
    // 注册页面点击事件
    _tapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapEvent:)];
    _tapRecognize.delegate = self;
    _tapRecognize.numberOfTapsRequired = 1;
    _tapRecognize.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:_tapRecognize];
    
    // 注册键盘监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


/* 点击手势回调事件*/
- (void)viewTapEvent:(UITapGestureRecognizer *)sender{
    [self.user_Phone resignFirstResponder];
    [self.user_Pwd resignFirstResponder];
}


-(void) keyboardWillShow:(NSNotification *)sender{
    
    //  NSDictionary *info = [sender userInfo];
    
    //  CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //  CGFloat playTime = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    
    
    
    
}


-(void) keyboardWillHide:(NSNotification *)sender{
    
    //  NSDictionary *info = [sender userInfo];
    
    //   CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //   CGFloat playTime = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    
    // CGRect frame = self.search.frame;
    
    
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}


/* 加载本页面的输入框背景视图*/
-(void) loadViewContentBG{
    
    [self.img_userPhone_BG setImage:IMG_InputView_BG];
    [self.img_userPwd_BG setImage:IMG_InputView_BG ];
    [self.btn_Login setBackgroundImage:IMG_White_Btn_BG forState:UIControlStateNormal];
    [self.btn_Login setBackgroundImage:IMG_White_Btn_BG forState:UIControlStateHighlighted];
    [self.btn_Register setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateNormal];
    [self.btn_Register setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateHighlighted];
    
}

#pragma mark -- 登陆按钮事件

- (BOOL)checkDataBeforeCommit{
    if ([self.user_Phone.text isEqualToString:@""]){
        
        [UIAlertView showAlertViewWithTitle:@"提示" message:@"手机号不能为空" cancelButtonTitle:nil otherButtonTitles:[NSArray arrayWithObject:@"确定"] onDismiss:^(int buttonIndex) {
            
        } onCancel:^{
            
        }];
        
        return NO;
    }
    
    if ([self.user_Pwd.text isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"密码不能为空"];
        return NO;
    }
    
    if (![[CommonFunc shareInstance] isValidatePhone:_user_Phone.text]){
        [[CommonFunc shareInstance] showHintMessage:@"手机号不合法"];
        return NO;
    }
    
    return YES;
}


- (IBAction)loginBtnEvent:(id)sender {
    
    [self.view endEditing:YES];
    if ([self checkDataBeforeCommit]) {
        // 调用接口 执行登陆验证操作
   
        NSString *md5Str = _user_Pwd.text;
        //md5Str = [md5Str MD5Digest];
        NSDictionary *condation = @{@"deviceToken":@""};
        
        NSDictionary *signDict = @{@"username":_user_Phone.text,@"password":md5Str};
        
        NSDictionary *postDict = [[Project_Func shareInstance] makePostParamsWithCondation:condation AndSignDict:signDict];
        
        NSLog(@"postDict Data is %@",postDict);
        
        NSString *url = @"http://www.amesante.com/AmesanteV2/interface/get_edituserinfo.php";
        NSDictionary *param = @{@"appkey":@"1",@"memberid":@"8",@"VERSION":@""};
    
        
        [self.httpManager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            if (responseObject){
                
                NSDictionary *dict = (NSDictionary *)responseObject;

                LKDBHelper * db = [UserInfo getUsingLKDBHelper];
                
                UserInfo *userinfo = [[UserInfo alloc] init];
                [userinfo setUserId:[dict objectForKey:UserInfo_UserID]];
                [userinfo setPersonName:[dict objectForKey:UserInfo_personName]];
                [userinfo setPersonIco:[dict objectForKey:UserInfo_personIco]];
                
                if ([db isExistsModel:userinfo]) {
                    
                    [db updateToDB:userinfo where:[NSString stringWithFormat:@"%@=%@",UserInfo_UserID,[dict objectForKey:UserInfo_UserID]]];
                    
                }else{
                    
                    [db insertWhenNotExists:userinfo];
                    
                }
                
                
            }else {
               
                [self showHintMessage:@"网络异常"];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
          //  [self showHintMessage:@"网络异常"];
        }];
        
        [self pushTOMainView];
    }
}



#pragma mark -- 找回密码
- (IBAction)resertPwdEvent:(id)sender {
    
    [self.view endEditing:YES];
    
    if([_user_Phone.text isEqualToString:@""]){
       
        [[CommonFunc shareInstance] showHintMessage:@"请先输入手机号"];
        return;
    
       if (![[CommonFunc shareInstance] isValidatePhone:_user_Phone.text]){
            [[CommonFunc shareInstance] showHintMessage:@"手机号不合法"];
            return;
       }
    }

    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"找回密码", nil];
    actionSheet.tag = 1;
    [actionSheet showInView:self.view];
    
    
}


#pragma mark -- UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 1){
        
        if (buttonIndex == 0){
            
            UIStoryboard *loginReg_SB = [UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil];
            UIViewController *loginReg_View =  [loginReg_SB instantiateViewControllerWithIdentifier:@"Login_Register_RESERTPWD"];
            [self.navigationController pushViewController:loginReg_View animated:YES];
            
        }else {
            
            
        }
        
    }
}


#pragma mark -- 登陆成功了跳转到主页面
-(void)pushTOMainView{
     [self.view endEditing:YES];
    //       JDMenuViewController *menuController = [[JDMenuViewController alloc] init];
    //       MainViewController *_contentController = [[MainViewController alloc] init];
    //
    //       [menuController setMainView:_contentController];
    //
    //       _contentController.view.backgroundColor = [UIColor colorWithHue:0.5 saturation:1.0 brightness:1.0 alpha:1.0];
    //       _contentController.title = @"HOME";
    //
    //      // UIViewController *navController = [[UINavigationController alloc] initWithRootViewController:contentController];
    //       JDSideMenu *sideMenu = [[JDSideMenu alloc] initWithContentController:_contentController
    //                                                             menuController:menuController];
    //       [sideMenu setBackgroundImage:[UIImage imageNamed:@"slide_BG"]];
    //

    
    //       [delegate.window.rootViewController transitionFromViewController:delegate.base_Nav toViewController:delegate.sideMenu duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    //
    //       } completion:^(BOOL finished) {
    //           
    //       }];
    
        [[NSNotificationCenter defaultCenter] postNotificationName:CHANGE_SCENCE object:nil];
    
}



@end
