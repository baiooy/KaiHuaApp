//
//  IndexQAController.m
//  KaiHua_App
//

#import "IndexQAController.h"

@interface IndexQAController ()

/*快速提问*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Quick_Ask;

/* 问答库*/
@property (weak, nonatomic) IBOutlet UIButton *btn_QA_Libiary;

/* 疾病库*/
@property (weak, nonatomic) IBOutlet UIButton *btn_JiBing_Libiary;

/* 查询医生*/
@property (weak, nonatomic) IBOutlet UIButton *btn_SearchDoctor;

/* 我的私人医生*/

@property (weak, nonatomic) IBOutlet UIButton *btn_PersnoalDoctor;

/* 上下滚动*/
@property (weak, nonatomic) IBOutlet UIScrollView *scv_GunGong;



@end

@implementation IndexQAController

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
    // Do any additional setup after loading the view from its nib.
    [self setViewTitle:@"问医生"];
    
    [self customerRightNavigationBarItemWithTitle:nil andImageRes:@"btn_QA_history"];
    
    [self.btn_Quick_Ask setBackgroundImage:IMG_ZISE_ASK_Now_Btn_BG forState:UIControlStateNormal];
//    if (IsIOS7) {
//        
//    }else{
        [self.scv_GunGong setContentSize:CGSizeMake(300, 550)];
        [self.scv_GunGong setScrollEnabled:YES];
//    }
    
    
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
    UIViewController *viewController =  [segue destinationViewController];
    [viewController setHidesBottomBarWhenPushed:YES];
}


#pragma mark -- 问答库
- (IBAction)btn_QALibirayEbent:(id)sender {
}



#pragma mark -- 疾病库
- (IBAction)btn_JiBingLibiaryEvent:(id)sender {
}


#pragma mark -- 查询医生
- (IBAction)btn_Search_Doctor:(id)sender {
    
//    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
//    
//    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"DoctorListViewController"];
//    [doctorView setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:doctorView animated:YES];
//    
}


#pragma mark -- 我的私人医生
- (IBAction)btn_MyPersonalDoctor:(id)sender {
   
//    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
//    
//    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"PersonalDocListController"];
//    [doctorView setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:doctorView animated:YES];
//    
}

#pragma mark -- 重载右键点击事件
-(void)navigationRightItemEvent{
    
    NSLog(@"RigthItem ClientEvent");
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"QuestinListViewController"];
    [doctorView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:doctorView animated:YES];
    
//    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
//    
//    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"HealthRemindViewController"];
//    [doctorView setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:doctorView animated:YES];
}




@end
