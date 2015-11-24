//
//  DoctorInfoViewController.m
//  KaiHua_App
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "DoctorInfoViewController.h"
#import "AddQuestionViewController.h"

@interface DoctorInfoViewController ()

/* 约医生*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Yuyue;
/* 问医生*/
@property (weak, nonatomic) IBOutlet UIButton *btn_QA;
/* 收藏医生*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Favourite;
/* 私人医生*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Persional_Doc;
/* 好评数量*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Favourite_Count;
/* 医生简介箭头*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Arrow;


/* 医生头像*/
@property (weak, nonatomic) IBOutlet UIImageView *img_Doctor_Ico;
/* 医生名称*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_Name;
/* 医生职称*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_Zhicheng;
/* 医院*/
@property (weak, nonatomic) IBOutlet UILabel *label_Hospital;
/* 科室*/
@property (weak, nonatomic) IBOutlet UILabel *label_Keshi;
/* 科室缩略图*/
@property (weak, nonatomic) IBOutlet UIImageView *img_KeshiICo;
/* 医生简介*/
@property (weak, nonatomic) IBOutlet UITextView *textView_DoctorInfo;
/* 上下滚动*/
@property (weak, nonatomic) IBOutlet UIScrollView *scv_GunGong;




@end

@implementation DoctorInfoViewController

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
     [self.navigationController.navigationBar setBackgroundImage:NavigationBar_UserCent_IMG forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    //隐藏navigationbar下面的黑线
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        NSArray *list=self.navigationController.navigationBar.subviews;
//        for (id obj in list) {
//            if ([obj isKindOfClass:[UIImageView class]]) {
//                UIImageView *imageView=(UIImageView *)obj;
//                imageView.hidden=YES;
//            }
//        }
//    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:NavigationBar_QA_IMG forBarMetrics:UIBarMetricsDefault];

//    //隐藏navigationbar下面的黑线
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        NSArray *list=self.navigationController.navigationBar.subviews;
//        for (id obj in list) {
//            if ([obj isKindOfClass:[UIImageView class]]) {
//                UIImageView *imageView=(UIImageView *)obj;
//                imageView.hidden=NO;
//            }
//        }
//    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setViewTitle:@"医生简介"];
    //[self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    // 自定义右边键
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    
    [self initFrameControlsStatus];

//    //隐藏navigationbar下面的黑线
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        NSArray *list=self.navigationController.navigationBar.subviews;
//        for (id obj in list) {
//            if ([obj isKindOfClass:[UIImageView class]]) {
//                UIImageView *imageView=(UIImageView *)obj;
//                imageView.hidden=YES;
//            }
//        }
//    }
    
    [self.scv_GunGong setContentSize:CGSizeMake(300, 600)];
    [self.scv_GunGong setScrollEnabled:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- 初始化页面控件状态
-(void)initFrameControlsStatus{
    [self.btn_QA setBackgroundImage:IMG_Btn_Doctorinfo_Blue_BG forState:UIControlStateNormal];
    [self.btn_Yuyue setBackgroundImage:IMG_Btn_Doctorinfo_Zise_BG forState:UIControlStateNormal];
    
    [self.btn_Yuyue setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 120)];
    
    [self.btn_QA setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 120)];
    
    [self.btn_Yuyue setTitleEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 100)];
    
    [self.btn_QA setTitleEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 100)];
}



#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  
}
*/

#pragma mark -- 收藏医生
- (IBAction)btn_FavouriteEvent:(id)sender {
}


#pragma mark -- 私人医生
- (IBAction)btn_PersionalEvent:(id)sender {
}

#pragma mark -- 好评
- (IBAction)btn_Favourite_Count:(id)sender {
}

#pragma mark -- 约医生
- (IBAction)btn_YuYueEvent:(id)sender {
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    AddQuestionViewController * ReservationView = [uSB instantiateViewControllerWithIdentifier:@"AddQuestionViewController"];
    ReservationView.viewType = VIEW_TYPE_RESERVATION;
    [ReservationView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:ReservationView animated:YES];
}

#pragma mark -- 问医生
- (IBAction)btn_QAEvent:(id)sender {
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    AddQuestionViewController * questionView = [uSB instantiateViewControllerWithIdentifier:@"AddQuestionViewController"];
    questionView.viewType = VIEW_TYPE_QA;
    [questionView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:questionView animated:YES];
}


@end
