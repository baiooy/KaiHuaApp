//
//  MyFavouriteViewController.m
//

#import "MyFavouriteViewController.h"
#import "QuestionList_Nomal_DocController.h"
#import "PersonalDocListController.h"
#import "HealthNewsViewController.h"



@interface MyFavouriteViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn_My_QA;

@property (weak, nonatomic) IBOutlet UIButton *btn_My_Article;

@property (weak, nonatomic) IBOutlet UIButton *btn_My_Doctors;

@property (weak, nonatomic) IBOutlet UIView *view_ContenerView;


@property(strong ,nonatomic) QuestionList_Nomal_DocController *questionListView;

@property(strong ,nonatomic) PersonalDocListController *doctorListView;

@property(strong ,nonatomic) HealthNewsViewController *myArticleView;

@property (strong, nonatomic) NSMutableArray *controlList;

@property (strong, nonatomic) UIViewController *currentView;


@end

@implementation MyFavouriteViewController

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
    [self setViewTitle:@"我的收藏"];
  //  [self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    /* 初始化ContenerViewConter*/
    [self initContenerViewControler];
    
    [self initTabBarItemState];
    
    [self btn_QAEvent:_btn_My_QA];
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


/* 初始化ContenerViewConter*/
-(void)initContenerViewControler{
    UIStoryboard *qaSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    _questionListView = [qaSB instantiateViewControllerWithIdentifier:@"QuestionList_Nomal_DocController"];
    
    _doctorListView = [qaSB instantiateViewControllerWithIdentifier:@"PersonalDocListController"];
    
    UIStoryboard *userCenterSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
    
    _myArticleView = [userCenterSB instantiateViewControllerWithIdentifier:@"HealthNewsViewController"];
    /* 当前资讯视图类型*/
    [_myArticleView setType:InitTypeCommend];
    
    [self addChildViewController:_questionListView];
    [self addChildViewController:_doctorListView];
    [self addChildViewController:_myArticleView];
    
    [self.view_ContenerView addSubview:_questionListView.view];
    _currentView = _questionListView;
    
}


-(void)initTabBarItemState{
    
    _controlList = [NSMutableArray array];
    
    [_controlList addObject:_btn_My_Article];
    [_controlList addObject:_btn_My_Doctors];
    [_controlList addObject:_btn_My_QA];
    
    [_btn_My_Article setImage:[UIImage imageNamed:@"btn_Favourite_Zixun_Sel"] forState:UIControlStateSelected];
    [_btn_My_Doctors setImage:[UIImage imageNamed:@"btn_Favourite_Doctor_Sel"] forState:UIControlStateSelected];
    [_btn_My_QA setImage:[UIImage imageNamed:@"btn_Favourite_QA_Sel"] forState:UIControlStateSelected];
}


#pragma mark -- 过敏，吸烟，喝酒 选择事件
-(void)setBtn_HeightEvent:(UIButton *)btn{
    
    if (btn.tag == 0){
        [btn setSelected:YES];
        [btn setTag:1];
    } else {
        [btn setTag:0];
        [btn setSelected:NO];
        
    }
}


/* 初始化 按钮状态*/
-(void)init_BtnHeightEvent:(NSMutableArray *)list{
    
    for (NSObject *obj in list) {
        UIButton *btn = (UIButton *)obj;
        if(btn.selected == YES){
            btn.selected = NO;
            btn.tag = 0;
        }
    }
}


-(void)setBtnHeightState:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [self init_BtnHeightEvent:_controlList];
    [self setBtn_HeightEvent:btn];
}



#pragma mark -- 菜单点击事件
- (IBAction)btn_QAEvent:(id)sender {
    [self setBtnHeightState:sender];
    
    if ([_currentView isKindOfClass:[QuestionList_Nomal_DocController class]]) return;
    
    
    [self transitionFromViewController:_currentView
                      toViewController:_questionListView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _questionListView;
                            }];

}


- (IBAction)btn_ArticleEvent:(id)sender {
    
    [self setBtnHeightState:sender];
    
    if ([_currentView isKindOfClass:[HealthNewsViewController class]]) return;
    
    [self transitionFromViewController:_currentView
                      toViewController:_myArticleView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _myArticleView;
                            }];
    
}


- (IBAction)btn_DoctorEvent:(id)sender {
    [self setBtnHeightState:sender];
    
    if ([_currentView isKindOfClass:[PersonalDocListController class]]) return;
    
    [self transitionFromViewController:_currentView
                      toViewController:_doctorListView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _doctorListView;
                            }];
}





@end
