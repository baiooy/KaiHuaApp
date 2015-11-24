//
//  HealthRemindViewController.m
//  KaiHua_App

//

#import "HealthRemindViewController.h"
#import "RemindMessageCell.h"
#import "PushArticleViewController.h"
#import "BaseNavViewController.h"

@interface HealthRemindViewController ()<UITableViewDataSource,UITableViewDelegate>

//显示健康提醒的table view
@property (weak, nonatomic) IBOutlet UITableView *tbv_remindTableView;

//推送消息  应从接口获取
@property (nonatomic , strong) NSArray *remindMessages;

@end

@implementation HealthRemindViewController



#pragma mark - Life Cycle -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib{
    
        [self.view setFrame:CGRectMake(0, 0, Screen_width, Screen_height - 106 - 40)];
   
}

//-(void)viewWillDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    [super viewWillDisappear:animated];
//
//    //在退出视图时显示系统状态栏
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
//}


-(void)viewWillAppear:(BOOL)animated{
     NSLog(@"健康提醒tttttttt-1");
    [super viewWillAppear:animated];

    
}
-(void)viewWillDisappear:(BOOL)animated{
    //    [self hideBottomTabBar];
    NSLog(@"健康提醒tttttttt-2");
    [super viewWillDisappear:animated];
    
}


-(void)viewDidDisappear:(BOOL)animated{
   NSLog(@"健康提醒tttttttt-3");
    //    [self hideBottomTabBar];
    [super viewDidAppear:animated];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setViewTitle:@"健康提醒"];
   // [self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
   // 自定义右边键
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    [self getRemindDataFromServer];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* 获得提醒数据*/
-(void)getRemindDataFromServer{
    
    NSDictionary *localDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LocalData" ofType:@"plist"]];
    
    _remindMessages = [localDict objectForKey:@"RemindContent"];
    
}

/* 自定义TableheadView*/
-(UIView *)customerTableViewHeardViewWithDict:(NSDictionary *)dict{
    
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 36)];
    [view setBackgroundColor:[UIColor colorWithRed:223.0/255 green:223.0/255 blue:223.0/255 alpha:1]];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[dict objectForKey:@"IMG"]]];
    
    UILabel *title = [[UILabel alloc] init];
    
    [title setText:[dict objectForKey:@"TITLE"]];
    
    if (dict) {
        
        CGRect imageRect = CGRectFromString([dict objectForKey:@"IMGFRAME"]) ;
        
        CGRect titleRect = CGRectMake(50, 0, Screen_width - 20, 35);
        
        [img setFrame:imageRect];
        [title setFrame:titleRect];
        
        [title setTextColor:[UIColor colorWithRed:57.0/255 green:57.0/255 blue:57.0/255 alpha:1]];
        [title setFont:FontOthers_CH(11)];
        [img setCenter:CGPointMake(30,view.frame.size.height / 2 + 3)];
        
        [title setCenter:CGPointMake(30 + img.frame.size.width / 2 + titleRect.size.width / 2 + 10, view.frame.size.height / 2 + 3)];
        
        [view addSubview:img];
        [view addSubview:title];
        
    }
    
    return view;
}


#pragma mark - Table View Data Source -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //根据接口返回的section数量确定
    return [_remindMessages count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //根据接口返回的每个section的消息数
    return [[_remindMessages objectAtIndex:section] count];
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //返回每个section的 header view
    
    //高度40  在xib里已经定义
    UIView *view ;
    if (section == 0) {
        
        NSDictionary *tjzsDict = [NSDictionary dictionaryWithObjectsAndKeys:@"吃药提醒推送",@"TITLE",@"img_health_Hint_Detail_Yaowu",@"IMG",@"{{0,0},{22,30}}",@"IMGFRAME", nil];
        view = [self customerTableViewHeardViewWithDict:tjzsDict];
        
    } else if (section == 1){
        
        NSDictionary *jkzkDict = [NSDictionary dictionaryWithObjectsAndKeys:@"咨询提醒推送",@"TITLE",@"img_health_Hint_Detail_Zixun",@"IMG",@"{{0,0},{25,23}}",@"IMGFRAME", nil];
        view = [self customerTableViewHeardViewWithDict:jkzkDict];
        
    } else if (section == 2){
        
        NSDictionary *xwysDict = [NSDictionary dictionaryWithObjectsAndKeys:@"专家预约提醒推送",@"TITLE",@"img_health_Hint_Detail_Yuyue",@"IMG",@"{{0,0},{26,20}}",@"IMGFRAME", nil];
        view = [self customerTableViewHeardViewWithDict:xwysDict];
    }
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RemindMessageCell";
    RemindMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[RemindMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell setRemindMessageWith:[[_remindMessages objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    
    [cell.btn_UnionItem addTarget:self action:@selector(cellUnionItemEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}

#pragma mark - Table View Delegate -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断section值  跳转到相应界面
}

-(void)cellUnionItemEvent:(UIButton *)sender{
    //NSDictionary *itemDict = sender.itemDict;
    int remindType = sender.tag;
    if ( remindType == 2){// 跳转到咨询页面
        
        UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
        
        UIViewController * pushView = [uSB instantiateViewControllerWithIdentifier:@"PushArticleViewController"];
        
        BaseNavViewController *nab_ArticView = [[BaseNavViewController alloc] initWithRootViewController:pushView];

        [nab_ArticView setBarBackGroundWithImage:NavigationBar_HealthService_IMG];

        [self.navigationController presentViewController:nab_ArticView animated:YES completion:nil];
    
    }else if ( remindType == 3){ // 跳转到医生介绍页
        
        UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
        
        UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"DoctorInfoViewController"];
        [doctorView setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:doctorView animated:YES];
    }
    
}

@end
