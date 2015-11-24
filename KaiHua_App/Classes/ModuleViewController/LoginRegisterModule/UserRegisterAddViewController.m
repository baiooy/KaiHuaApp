//
//  UserRegisterAddViewController.m
//  KaiHua_App


#import "UserRegisterAddViewController.h"
#import "AppDelegate.h"
#import "CMSCoinView.h"
#import "CoinViewController.h"
#import "CoinNomalViewController.h"
#import "UserInfo.h"

@interface UserRegisterAddViewController ()<CoinViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

{
    
    UIView *curSel_Item;
    UIView *curSel_View;
    NSMutableArray *gmContrilsList;
    NSMutableArray *smokeContrilsList;
    NSMutableArray *drinkContrilsList;
    
}

typedef enum{
    cellType_Name = 0,
    cellType_Height,
    cellType_Weight,
} CellType;

/* 背景视图*/
@property (weak, nonatomic) IBOutlet UIImageView *img_RegAdd_GM;

@property (weak, nonatomic) IBOutlet UIImageView *img_RegAdd_Smoke;

@property (weak, nonatomic) IBOutlet UIImageView *img_RegAdd_Drink;

/* 过敏*/
@property (weak, nonatomic) IBOutlet UIButton *btn_RedAdd_GM_Yes;

@property (weak, nonatomic) IBOutlet UIButton *btn_RedAdd_GM_No;

/* 吸烟*/
@property (weak, nonatomic) IBOutlet UIButton *btn_RedAdd_Smoke_Yes;

@property (weak, nonatomic) IBOutlet UIButton *btn_RedAdd_Smoke_No;

/* 喝酒*/
@property (weak, nonatomic) IBOutlet UIButton *btn_RedAdd_Drink_Yes;

@property (weak, nonatomic) IBOutlet UIButton *btn_RedAdd_Drink_No;

/* 提交信息*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Commite;


/* 身高翻转视图*/
@property (weak, nonatomic) IBOutlet CMSCoinView *coinView_Height;

/* 体重翻转视图*/
@property (weak, nonatomic) IBOutlet CMSCoinView *coinView_Weight;


/* 身高，体重选择器*/
@property (weak, nonatomic) IBOutlet UIView *pickView_BG;
/* 选择器标题*/
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barBtn_Title;
/* 选择器*/
@property (weak, nonatomic) IBOutlet UIPickerView *pickView_Control;


/* 用户本地plist 数据*/
@property (retain, nonatomic) NSDictionary *UserPickerData;


/* 选择的体重值*/
@property(copy ,nonatomic) NSString *select_Weight;


/* 选择的身高值*/
@property(copy ,nonatomic) NSString *select_Height;



@end

@implementation UserRegisterAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _select_Height = @"";
        _select_Weight = @"";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
//    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
     self.navigationController.navigationBarHidden = NO;
    // Do any additional setup after loading the view.
    [self customerViewControllBgWithImage:@"img_RegisterAdd_BG"];
    
    [self.btn_Commite setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateNormal];
    [self.btn_Commite setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateHighlighted];
    

    /* 初始化身高和体重翻滚视图*/
    [self initWeightAndHeightFrame];
    
    /* 体重选择器*/
    [self.pickView_BG setFrame:CGRectMake(0, Screen_height, Screen_width, _pickView_BG.frame.size.height)];
    
    // 加载PikerView 数据
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"UserInfoData" ofType:@"plist"];
    self.UserPickerData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    /* 设置按钮状态*/
    [self initViewControls];
    
    /* 用用户信息*/
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

/* 初始化身高和体重翻滚视图*/
-(void) initWeightAndHeightFrame{
    
    CoinViewController *coinViewB = [[CoinViewController alloc] initWithNibName:@"CoinViewController" bundle:nil];
   // [coinViewB setUser_Type:@"身高"];
    [coinViewB setCoin_Image_B:[UIImage imageNamed:@"btn_Health_Profile_Height_sel"]];
    coinViewB.view.tag = 2;
    
    CoinNomalViewController *conViewA = [[CoinNomalViewController alloc] initWithNibName:@"CoinNomalViewController" bundle:nil];
    [conViewA setUser_Item_ICO:[UIImage imageNamed:@"img_Reg_Height"]];
    conViewA.view.tag = 1;
    
    [_coinView_Height setDelegate:self];
    [_coinView_Height setPrimaryView:conViewA.view];
    [_coinView_Height setSecondaryView:coinViewB.view];
    [_coinView_Height setSpinTime:1.0];
    [_coinView_Height setTag:1];
    
    
    
    
    CoinViewController *coinViewWeight_B = [[CoinViewController alloc] initWithNibName:@"CoinViewController" bundle:nil];
    [coinViewWeight_B setUser_Type:@"体重"];
    [coinViewWeight_B setCoin_Image_B:[UIImage imageNamed:@"btn_Health_Profile_Weight_sel"]];
    coinViewWeight_B.view.tag = 2;
    
    CoinNomalViewController *conViewWeightA = [[CoinNomalViewController alloc] initWithNibName:@"CoinNomalViewController" bundle:nil];
    [conViewWeightA setUser_Item_ICO:[UIImage imageNamed:@"img_Reg_Weight"]];
    conViewWeightA.view.tag = 1;
    
    
    [_coinView_Weight setDelegate:self];
    [_coinView_Weight setPrimaryView:conViewWeightA.view];
    [_coinView_Weight setSecondaryView:coinViewWeight_B.view];
    [_coinView_Weight setSpinTime:1.0];
    [_coinView_Weight setTag:2];
}


/* 设置按钮状态*/
-(void)initViewControls{
    [_btn_RedAdd_GM_No setBackgroundImage:[UIImage imageNamed:@"btn_RegiatAddNo_sel"] forState:UIControlStateSelected];
    [_btn_RedAdd_GM_Yes setBackgroundImage:[UIImage imageNamed:@"btn_RegiatAddYes_sel"] forState:UIControlStateSelected];
    [_btn_RedAdd_Smoke_No setBackgroundImage:[UIImage imageNamed:@"btn_RegiatAddNo_sel"] forState:UIControlStateSelected];
    [_btn_RedAdd_Smoke_Yes setBackgroundImage:[UIImage imageNamed:@"btn_RegiatAddYes_sel"] forState:UIControlStateSelected];
    [_btn_RedAdd_Drink_No setBackgroundImage:[UIImage imageNamed:@"btn_RegiatAddNo_sel"] forState:UIControlStateSelected];
    [_btn_RedAdd_Drink_Yes setBackgroundImage:[UIImage imageNamed:@"btn_RegiatAddYes_sel"] forState:UIControlStateSelected];
    
    gmContrilsList = [NSMutableArray array];
    smokeContrilsList = [NSMutableArray array];
    drinkContrilsList = [NSMutableArray array];
    
    
    [gmContrilsList addObject:_btn_RedAdd_GM_No];
    [gmContrilsList addObject:_btn_RedAdd_GM_Yes];
    
    [smokeContrilsList addObject:_btn_RedAdd_Smoke_No];
    [smokeContrilsList addObject:_btn_RedAdd_Smoke_Yes];
    
    [drinkContrilsList addObject:_btn_RedAdd_Drink_No];
    [drinkContrilsList addObject:_btn_RedAdd_Drink_Yes];
    
}


-(void)initLocalTable{
    
    LKDBHelper *userTable = [LKDBHelper getUsingLKDBHelper];
    [userTable createTableWithModelClass:[UserInfo class]];
    
    UserInfo *userinfo = [[UserInfo alloc] init];
    
    [userTable insertWhenNotExists:userinfo];
    
    
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


- (IBAction)btn_GM_YES_Event:(id)sender {
   
    UIButton *btn = (UIButton *)sender;
    
//    void (^changeBtnState)(NSMutableArray *) = ^(NSMutableArray *array){
//        
//        for (NSObject *obj in array) {
//            UIButton *btn = (UIButton *)obj;
//            if(btn.selected == YES){
//                btn.selected = NO;
//                btn.tag = 0;
//            }
//        }
//        
//    };
    
    [self init_BtnHeightEvent:gmContrilsList];
    
    [self setBtn_HeightEvent:btn];
    
}

- (IBAction)btn_GM_NoEvent:(id)sender {
    
    UIButton *btn = (UIButton *)sender;
  
    [self init_BtnHeightEvent:gmContrilsList];
    
    [self setBtn_HeightEvent:btn];
    
}


- (IBAction)btn_Smoke_YesEvent:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    [self init_BtnHeightEvent:smokeContrilsList];
    
    [self setBtn_HeightEvent:btn];
}


- (IBAction)btn_Smoke_NoEvent:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    [self init_BtnHeightEvent:smokeContrilsList];
    [self setBtn_HeightEvent:btn];
}


- (IBAction)btn_Drink_YesEvent:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    [self init_BtnHeightEvent:drinkContrilsList];
    
    [self setBtn_HeightEvent:btn];
}

- (IBAction)btn_Drink_NoEvent:(id)sender {
    UIButton *btn = (UIButton *)sender;
    [self init_BtnHeightEvent:drinkContrilsList];
    [self setBtn_HeightEvent:btn];
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

/* 跳过执行事件*/
- (IBAction)btnSkipeEnvent:(id)sender {
    
//    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//    
//    delegate.window.rootViewController = delegate.sideMenu;
     self.navigationController.navigationBarHidden = YES;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CHANGE_SCENCE object:nil];
    
}


#pragma mark -- CoinViewDelegate 
-(void)coionViewToucheEventWithObj:(UIView *)view andCoinView:(UIView *)sender{
   
    curSel_Item = view;
    curSel_View = sender;
    if (view.tag == 1){
        
            [_pickView_Control setTag:cellType_Height];
            [_barBtn_Title setTitle:@"身高"];
            [_pickView_Control reloadAllComponents];
            [UIView animateWithDuration:0.3f animations:^{
                
                [_pickView_BG setFrame:CGRectMake(0, Screen_height - _pickView_BG.frame.size.height, Screen_width,_pickView_BG.frame.size.height )];
                
            } completion:^(BOOL finished) {
                
            }];
            
        
    }else {
       
            [_pickView_Control setTag:cellType_Weight];
            [_barBtn_Title setTitle:@"体重"];
            [_pickView_Control reloadAllComponents];
            [UIView animateWithDuration:0.3f animations:^{
                
                [_pickView_BG setFrame:CGRectMake(0, Screen_height - _pickView_BG.frame.size.height, Screen_width,_pickView_BG.frame.size.height )];
                
            } completion:^(BOOL finished) {
                
            }];
        
    }
    
    
   
}

/* 获得当前的性别*/
-(NSString *)getButtonStateWithBtnName:(NSString *)btn{
    
    NSString *state_Str = @"";
    
    UIButton *btn_Yes = (UIButton *)NSClassFromString([NSString stringWithFormat:@"%@_Yes",btn]);
    UIButton *btns_No = (UIButton *)NSClassFromString([NSString stringWithFormat:@"%@_No",btn]);
    
    if (btn_Yes.selected) state_Str = @"1";
    if (btns_No.selected) state_Str = @"0";
    
    return state_Str;
}


-(BOOL)checkData{
    
    if ([self.select_Height isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入身高"];
        return NO;
    }
    if ([self.select_Weight isEqualToString:@""]){
        [[CommonFunc shareInstance] showHintMessage:@"请输入体重"];
        return NO;
    }
    
    if ([self getButtonStateWithBtnName:@"btn_RedAdd_GM"]){
        
        [[CommonFunc shareInstance] showHintMessage:@"确定是否过敏"];
        return NO;
    }
    
    if ([self getButtonStateWithBtnName:@"btn_RedAdd_Smoke"]){
        
        [[CommonFunc shareInstance] showHintMessage:@"确定是否吸烟"];
        return NO;
    }

    if ([self getButtonStateWithBtnName:@"btn_RedAdd_Drink"]){
        
        [[CommonFunc shareInstance] showHintMessage:@"确定是否喝酒"];
        return NO;
    }
    
    return YES;
}


#pragma mark -- 提交按钮事件
- (IBAction)btnCommitEvent:(id)sender {
    

//    if(![self checkData]) return;
//    
//    
//    NSDictionary *condation = @{@"residentHigh":_select_Height,@"residentWeight":_select_Weight};
//    
//    NSDictionary *signDict = @{@"userId":@"1"};
//    
//    NSDictionary *postDict = [[Project_Func shareInstance] makePostParamsWithCondation:condation AndSignDict:signDict];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
//    [manager POST:FUN_USER_REGISTER parameters:postDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"JSON: %@", responseObject);
//        if (responseObject){
//            
//            NSArray* list  = [responseObject objectForKey:@"data"];
//            NSLog(@"admin Data is %@",[list objectAtIndex:0]);
//            
//            
//        }else {
//            
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//         NSLog(@"Error: %@", error);
//    }];
//    
//    
    [self btnSkipeEnvent:nil];
    
}




#pragma UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    switch (pickerView.tag) {
    
        case cellType_Height:
        {
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
            return heightList.count;
            
        }
            break;
        case cellType_Weight:
        {
            NSArray *weightList= [self.UserPickerData objectForKey:@"user_weight"];
            return weightList.count;
        }
            break;
        default:
            break;
    }
    
    return 0;
}



#pragma UIPickerViewDelegate


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 260, 30)];
    lab.backgroundColor = [UIColor clearColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:18.0f];
    
    switch (pickerView.tag) {
        case cellType_Height:
        {
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
            
            lab.text = [heightList objectAtIndex:row];
            return lab;
        }
            break;
        case cellType_Weight:
        {
            NSArray *weightList= [self.UserPickerData objectForKey:@"user_weight"];
            
            lab.text = [weightList objectAtIndex:row];
            return lab;
        }
            break;

        default:
            break;
    }
    
     return nil;
}

// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 300;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    
    
}


- (IBAction)btnPickerViewCancelEvent:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_pickView_BG setFrame:CGRectMake(0, Screen_height, Screen_width,_pickView_BG.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
}


- (IBAction)btn_PickerViewOKEvent:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_pickView_BG setFrame:CGRectMake(0, Screen_height, Screen_width,_pickView_BG.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    if (curSel_Item.tag == 1){
      
        if (curSel_View.tag == 1){
        [_coinView_Height flipTouched:nil];
        }
        
        UILabel *label_Value = (UILabel *)[_coinView_Height viewWithTag:10];
        NSInteger row=[_pickView_Control selectedRowInComponent:0];
        NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
        [label_Value setText:[heightList objectAtIndex:row]];
        [label_Value setTextAlignment:NSTextAlignmentCenter];

        _select_Height = label_Value.text;
    }else {
        if (curSel_View.tag == 1){
            [_coinView_Weight flipTouched:nil];
        }
    
        UILabel *label_Value = (UILabel *)[_coinView_Weight viewWithTag:10];
        NSInteger row=[_pickView_Control selectedRowInComponent:0];
        NSArray *heightList= [self.UserPickerData objectForKey:@"user_weight"];
        [label_Value setText:[heightList objectAtIndex:row]];
        [label_Value setTextAlignment:NSTextAlignmentCenter];
        _select_Weight = label_Value.text;
    }
    
   

    
    
}



@end
