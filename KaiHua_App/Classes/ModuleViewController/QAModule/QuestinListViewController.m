//
//  QuestinListViewController.m
//  KaiHua_App

//

#import "QuestinListViewController.h"
#import "QuestionList_Nomal_DocController.h"
#import "QuestionList_Personal_DocController.h"


@interface QuestinListViewController ()

/* 医生类型*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Type_Persional;

@property (weak, nonatomic) IBOutlet UIButton *btn_Type_Nomail;

/* 导航视图*/
@property (weak, nonatomic) IBOutlet UIView *view_ContenerView;


/* ViewController*/
@property (strong, nonatomic) QuestionList_Nomal_DocController *nomalView;
@property (strong, nonatomic) QuestionList_Personal_DocController *persionalView;

@property (strong, nonatomic) UIViewController *currentView;

@property (strong, nonatomic) NSMutableArray *controlList;



@end

@implementation QuestinListViewController

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
    [self setViewTitle:@"问医生"];
   // [self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    // 自定义右边键
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
  /* 初始化ContenerViewConter*/
    [self initContenerViewControler];
    
    [self initFrameLayoutControls];
    
    [self btn_NomailEvent:_btn_Type_Nomail];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/* 初始化控件*/
-(void)initFrameLayoutControls{
    [_btn_Type_Nomail setBackgroundImage:[UIImage imageNamed:@"btn_QAHistory_Nomal_Doc_sel"] forState:UIControlStateSelected];
    [_btn_Type_Persional setBackgroundImage:[UIImage imageNamed:@"btn_QAHistory_PersentDoc_sel"] forState:UIControlStateSelected];
    
    _controlList = [NSMutableArray array];
    [_controlList addObject:_btn_Type_Nomail];
    [_controlList addObject:_btn_Type_Persional];
    
}



/* 初始化ContenerViewConter*/
-(void)initContenerViewControler{
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
  
    _nomalView = [uSB instantiateViewControllerWithIdentifier:@"QuestionList_Nomal_DocController"];
    
    _persionalView = [uSB instantiateViewControllerWithIdentifier:@"QuestionList_Personal_DocController"];
    
    [self addChildViewController:_nomalView];
    [self addChildViewController:_persionalView];
    
    [self.view_ContenerView addSubview:_persionalView.view];
    _currentView = _persionalView;
    
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
#pragma mark -- 私人医生 ，普通医生切换事件
- (IBAction)btnPersionalEvent:(id)sender {
   
    [self setBtnHeightState:sender];
    
    if ([_currentView isKindOfClass:[QuestionList_Personal_DocController class]]) return;
    
    
    [self transitionFromViewController:_currentView
                      toViewController:_persionalView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _persionalView;
                            }];

    
}


- (IBAction)btn_NomailEvent:(id)sender {
    
    [self setBtnHeightState:sender];
    
    if ([_currentView isKindOfClass:[QuestionList_Nomal_DocController class]]) return;
    
    [self transitionFromViewController:_currentView
                      toViewController:_nomalView
                              duration:0.5f
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {
                                _currentView = _nomalView;
                            }];
    

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



@end
