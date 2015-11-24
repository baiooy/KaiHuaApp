//
//  IndexHealthServerController.m
//  KaiHua_App
//

//

#import "IndexHealthServerController.h"
#import "HealthServerHomePageViewController.h"
#import "HealthRemindViewController.h"
#import "HealthEvaluateViewController.h"
#import "HealthTestpaperViewController.h"


@interface IndexHealthServerController ()

#pragma mark - 屏幕顶部部分   - 健康评测 - 健康提醒 - 健康问卷 -

//健康评测按钮
@property (weak, nonatomic) IBOutlet UIButton *btn_healthEvaluateButton;

//健康提醒按钮
@property (weak, nonatomic) IBOutlet UIButton *btn_healthRemindButton;

//健康问卷按钮
@property (weak, nonatomic) IBOutlet UIButton *btn_healthTestpaperButton;

//用于显示首页和健康提醒等视图的容器view
@property (weak, nonatomic) IBOutlet UIView *view_contentView;
/* 上下滚动*/
@property (weak, nonatomic) IBOutlet UIScrollView *scv_GunGong;

/* ViewController*/
@property (strong, nonatomic) HealthServerHomePageViewController *HomePageView;
@property (strong, nonatomic) HealthRemindViewController *RemindView;
@property (strong, nonatomic) HealthEvaluateViewController *EvaluateView;
@property (strong, nonatomic) HealthTestpaperViewController *TestPaperView;

@property (strong, nonatomic) UIViewController *currentView;


@property (strong, nonatomic) NSMutableArray *controlList;


@end

@implementation IndexHealthServerController

#pragma mark - 按钮事件 -


- (IBAction)healthEvaluate:(id)sender
{
    NSLog(@"健康评测按钮");
    [self hideScrollEna];
  /*
     *更换按钮图片
     *
     *更换视图中心显示内容
     *
     */
   if ([_currentView isKindOfClass:[HealthEvaluateViewController class]]){
       
       [self showBottomTabBar];
       
       /* 取消按钮高亮*/
        [self init_BtnHeightEvent:_controlList];
       
       
            [self transitionFromViewController:_currentView
                              toViewController:_HomePageView
                                      duration:0.5f
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:nil
                                    completion:^(BOOL finished) {
                                        _currentView = _HomePageView;
                                    }];
            return;
        }
   
    [self hideBottomTabBar];
    
    [self setBtnHeightState:sender];
    
    [self transitionFromViewController:_currentView
                      toViewController:_EvaluateView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _EvaluateView;
                            }];
}

- (IBAction)healthRemind:(id)sender
{
    NSLog(@"健康提醒按钮");
    [self hideBottomTabBar];
    [self hideScrollEna];

    /*
     *更换按钮图片
     *
     *更换视图中心显示内容
     *
     */

        if ([_currentView isKindOfClass:[HealthRemindViewController class]]){
            
            [self showBottomTabBar];
            
            /* 取消按钮高亮*/
            [self init_BtnHeightEvent:_controlList];
            
            [self transitionFromViewController:_currentView
                              toViewController:_HomePageView
                                      duration:0.5f
                                       options:UIViewAnimationOptionTransitionCrossDissolve
                                    animations:nil
                                    completion:^(BOOL finished) {
                                        _currentView = _HomePageView;
                                    }];
            return;
        }
   
    [self setBtnHeightState:sender];
    [self transitionFromViewController:_currentView
                      toViewController:_RemindView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _RemindView;
                            }];
}

- (IBAction)healthTest:(id)sender
{
    NSLog(@"健康问卷按钮");
    [self hideScrollEna];
      /*
     *更换按钮图片
     *
     *更换视图中心显示内容
     *
     */
    if ([_currentView isKindOfClass:[HealthTestpaperViewController class]]){
        
        [self showBottomTabBar];
        
        /* 取消按钮高亮*/
        [self init_BtnHeightEvent:_controlList];
        
        [self transitionFromViewController:_currentView
                          toViewController:_HomePageView
                                  duration:0.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:nil
                                completion:^(BOOL finished) {
                                    _currentView = _HomePageView;
                                }];
        return;
    }
    
    [self hideBottomTabBar];
    
    [self setBtnHeightState:sender];

    [self transitionFromViewController:_currentView
                      toViewController:_TestPaperView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _TestPaperView;
                            }];
}


#pragma mark - Life Cycle -

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

    
}
-(void)viewWillDisappear:(BOOL)animated{
//    [self hideBottomTabBar];
    [super viewWillDisappear:animated];

}


-(void)viewDidDisappear:(BOOL)animated{
//    NSLog(@"健康服务3333-333");
//    [self hideBottomTabBar];
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setViewTitle:@"健康服务3333"];
    
    
    [self initContenerViewControler];
    
    [self initTabBarItemState];
    
    [self.scv_GunGong setContentSize:CGSizeMake(300, 500)];
    [self.scv_GunGong setScrollEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/* 初始化ContenerViewConter*/
-(void)initContenerViewControler{
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
    
    _HomePageView = [uSB instantiateViewControllerWithIdentifier:@"HealthServerHomePageViewController"];
    
    _RemindView = [uSB instantiateViewControllerWithIdentifier:@"HealthRemindViewController"];
    
    _EvaluateView = [uSB instantiateViewControllerWithIdentifier:@"HealthEvaluateViewController"];
    
    _TestPaperView = [uSB instantiateViewControllerWithIdentifier:@"HealthTestpaperViewController"];
  
    [self addChildViewController:_HomePageView];
    [self addChildViewController:_RemindView];
    [self addChildViewController:_EvaluateView];
    [self addChildViewController:_TestPaperView];
    
    _RemindView.view.frame = CGRectMake(0, 0, 320, 464);
    _EvaluateView.view.frame = CGRectMake(0, 0, 320, 464);
    _TestPaperView.view.frame = CGRectMake(0, 0, 320, 464);
    
    [self.view_contentView addSubview:_HomePageView.view];
    _currentView = _HomePageView;
    
}


-(void)initTabBarItemState{
    
    _controlList = [NSMutableArray array];
    
    [_controlList addObject:_btn_healthEvaluateButton];
    [_controlList addObject:_btn_healthRemindButton];
    [_controlList addObject:_btn_healthTestpaperButton];
    
    [_btn_healthEvaluateButton setImage:[UIImage imageNamed:@"btn_HealthService_PingCe_sel"] forState:UIControlStateSelected];
    [_btn_healthRemindButton setImage:[UIImage imageNamed:@"btn_HealthService_Remind_sel"] forState:UIControlStateSelected];
    [_btn_healthTestpaperButton setImage:[UIImage imageNamed:@"btn_HealthService_Wenjuan_sel"] forState:UIControlStateSelected];
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

#pragma mark - 重写右侧返回键方法

-(void)backToView
{
    [self showBottomTabBar];
     [self showScrollEna];
    [self transitionFromViewController:_currentView
                      toViewController:_HomePageView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _HomePageView;
                            }];
}

#pragma mark - 显示/隐藏 底部导航栏


- (void) showScrollEna
{
    [self.scv_GunGong setScrollEnabled:YES];

}


- (void)hideScrollEna
{
    [self.scv_GunGong setScrollEnabled:NO];

    
}


- (void) showBottomTabBar
{
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:nil];
    //    self.tabBarController.tabBar.hidden = NO;
    
//    CGRect frame = self.view.frame;
//    frame.size.height -= self.tabBarController.tabBar.frame.size.height;
//    self.view.frame = frame;
//    
//    frame = self.view_contentView.frame;
//    frame.size.height -= self.tabBarController.tabBar.frame.size.height;
//    self.view_contentView.frame = frame;
}

- (void) hideBottomTabBar
{
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
     //    self.tabBarController.tabBar.hidden = YES;
    
//    CGRect frame = self.view.frame;
//    frame.size.height += self.tabBarController.tabBar.frame.size.height;
//    self.view.frame = frame;
//    
//    frame = self.view_contentView.frame;
//    frame.size.height += self.tabBarController.tabBar.frame.size.height;
//    self.view_contentView.frame = frame;
//    
//    self.view.backgroundColor = [UIColor redColor];
//    self.view_contentView.backgroundColor = [UIColor greenColor];
}

@end
