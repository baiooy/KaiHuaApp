//
//  IndexHomeController.m
//  KaiHua_App

//

#import "IndexHomeController.h"
#import "UserMeasureDataViewController.h"
#import "AddQuestionViewController.h"

#import "UserInfo.h"
#import "HomePage.h"


@interface IndexHomeController ()

/* 显示 当前用户的统计信息*/
@property (weak, nonatomic) IBOutlet BaseButton *btn_Question_Count;

@property (weak, nonatomic) IBOutlet BaseButton *btn_Reserviation_Count;

@property (weak, nonatomic) IBOutlet BaseButton *btn_Service_count;

@property (weak, nonatomic) IBOutlet BaseLabel *label_Coin_Count;

@property (weak, nonatomic) IBOutlet BaseLabel *label_Gluess_Value;

@property (weak, nonatomic) IBOutlet BaseLabel *label_Blood_Press;



@end

@implementation IndexHomeController

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
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar setBackgroundImage:NavigationBar_HomePage_IMG forBarMetrics:UIBarMetricsDefault];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setViewTitle:@"KaiHua Healthy"];
    
    [self loadDataFromServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UIViewController *distinaionView = segue.destinationViewController;
    [distinaionView setHidesBottomBarWhenPushed:YES];
    
}






- (IBAction)btn_Measure_ItemEvent:(id)sender {
    
//    sender.
    
    UIButton *button = (UIButton *)sender;

    NSString *intstr=@"0";
    
    if (button.tag==30) {
        intstr=@"2";
    }else if(button.tag==40) {
        intstr=@"0";
    }else{
        intstr=@"0";
    }
    
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    
    UserMeasureDataViewController *measureView = [uSB instantiateViewControllerWithIdentifier:@"UserMeasureDataViewController"];
    
    [measureView setHidesBottomBarWhenPushed:YES];
    NSDictionary *selection_parm = [NSDictionary dictionaryWithObjectsAndKeys:
                                    intstr, @"type",
                                    nil];
    [measureView setValue:selection_parm forKey:@"selection"];
     [self.navigationController pushViewController:measureView animated:YES];
    
//  UserMeasureDataViewController *measureView = [[UserMeasureDataViewController alloc] initWithNibName:@"UserMeasureDataViewController" bundle:nil];
//   [self.navigationController pushViewController:measureView animated:YES];
    
}

#pragma mark -- 马上咨询
- (IBAction)btnASKDocNowEvent:(id)sender {
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    AddQuestionViewController * QAView = [uSB instantiateViewControllerWithIdentifier:@"AddQuestionViewController"];
    QAView.viewType = VIEW_TYPE_QA;
    [QAView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:QAView animated:YES];
    
    
}


#pragma mark -- 提醒信息按钮

- (IBAction)btnUserRemindEvent:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 10:{
            UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
            
            UIViewController * QuestionListView = [uSB instantiateViewControllerWithIdentifier:@"QuestinListViewController"];
            [QuestionListView setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:QuestionListView animated:YES];
        }
            
            break;
        case 20:{
            UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"Reservation" bundle:nil];
            
            UIViewController * reservationView = [uSB instantiateViewControllerWithIdentifier:@"ReservationViewController"];
            [reservationView setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:reservationView animated:YES];
        }
            
            break;
        case 30:{
            UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
            
            UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"HealthRemindViewController"];
            [doctorView setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:doctorView animated:YES];
        }
            
            break;
        case 40:{// 新功能上线等 系统提醒 也暂时跳转到提醒页面
       
            UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
            
            UIViewController * infoView = [uSB instantiateViewControllerWithIdentifier:@"SystemInfoViewController"];
            [infoView setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:infoView animated:YES];
            
        }
            break;
        default:
            break;
    }
    

}


/* 加载网络模块 获取数据*/
-(void)loadDataFromServer{
    
   // [self showLoadingView];
    
    LKDBHelper *db = [HomePage getUsingLKDBHelper];
    
    HomePage *homePage = [[HomePage alloc] init];
    homePage.userId = @"2";
    if ([db isExistsModel:homePage]) {
        
        
    }else{
        
       // [db createTableWithModelClass:[HomePage class]];
       // [db createTableWithModelClass:[SystemNotice class]];
        
        homePage.userId = @"1";
        homePage.bloodGlucose = @"12";
        [db insertToDB:homePage];
    }
    
    
//    UserInfo *userInfo = [[UserInfo alloc] init];
//    if([[LKDBHelper getUsingLKDBHelper] isExistsModel:userInfo]){
//        
//        NSString *value = [[LKDBHelper getUsingLKDBHelper] searchSingle:[UserInfo class] where:@{User_ID:@"1"} orderBy:nil];
//    }else{
//        
//        userInfo.userId = @"1";
//        userInfo.userMobilePhone = @"15618297762";
//        userInfo.personBirthday = @"1987-12-12";
//
//        [[LKDBHelper getUsingLKDBHelper] insertToDB:userInfo];
//    }
    
    
    // 调用接口 执行登陆验证操
    // 获取访问令牌

    
//    NSDictionary *condation = @{DEVICE_TOKEN:@""};
//    
//    NSDictionary *signDict = @{@"username":_user_Phone.text,@"password":md5Str};
//    
//    NSDictionary *postDict = [[Project_Func shareInstance] makePostParamsWithCondation:condation AndSignDict:signDict];
//    
//    NSLog(@"postDict Data is %@",postDict);
//    
//    // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    [self.httpManager POST:FUN_USER_LOGIN parameters:postDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"JSON: %@", responseObject);
//        if (responseObject){
//            
//            
//            NSDictionary *dict = (NSDictionary *)responseObject;
//            
//            NSLog(@"dict is %@",dict);
//            // [[FormatData shareInstance] ]
//            
//            
//            NSArray* list  = [responseObject objectForKey:@"data"];
//            NSLog(@"admin Data is %@",[list objectAtIndex:0]);
//            LKDBHelper * userDB = [LKDBHelper getUsingLKDBHelper];
////            
////            UserInfo *userTable = [[UserInfo alloc] init];
////            
////            if([userDB isExistsModel:userTable]){
////                
////                [userTable setUserId:@"userId"];
////                [userTable setPersonName:@"userName"];
////                [userTable setPersonIco:@"headSculptureURL"];
////                
////                [userDB updateToDB:userTable where:nil];
////            }else {
////                
////                [userDB createTableWithModelClass:[userTable class]];
////                
////                [userTable setUserId:@"userId"];
////                [userTable setPersonName:@"userName"];
////                [userTable setPersonIco:@"headSculptureURL"];
////                
////                [userDB insertToDB:userTable];
////            }
////            
//            
//        }else {
//            
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"Error: %@", error);
//    }];
//
//    
    
}








@end
