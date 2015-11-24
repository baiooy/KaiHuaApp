//
//  DoctorListViewController.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "DoctorListViewController.h"
#import "DoctorListCell.h"
#import "DropDownListView.h"

@interface DoctorListViewController ()<DropDownChooseDataSource,DropDownChooseDelegate>
{
   NSMutableArray *chooseArray ;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView_Doctor;



@end

@implementation DoctorListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _viewType = VIEW_TYPE_QA;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *viewTitle;

    switch (_viewType) {
        case VIEW_TYPE_QA:{
            viewTitle = @"查询医生";
          //  [self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
            // 自定义右边键
            [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
            

        }

            break;
        case VIEW_TYPE_RESERVATION:{
            viewTitle = @"约专家";
            
            [self customerRightNavigationBarItemWithTitle:nil andImageRes:@"btn_QA_history"];
        }

            break;
        default:
            break;
    }
    
    [self setViewTitle:viewTitle];
    
    [self.tableView_Doctor registerNib:[UINib nibWithNibName:@"DoctorListCell" bundle:nil] forCellReuseIdentifier:@"DoctorListCell"];

    
    chooseArray = [NSMutableArray arrayWithArray:@[
                                                   @[@"上海市",@"北京市",@"浙江省",@"江苏省"],
                                                   @[@"杨浦区",@"长宁区",@"浦东新区",@"黄浦区"],
                                                   @[@"华山医院",@"新华医院",@"中山医院"],
                                                   @[@"心血管科",@"心内科",@"心外科"]
                                                   ]];
    
    DropDownListView * dropDownView = [[DropDownListView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 42) dataSource:self delegate:self];
    dropDownView.mSuperView = self.view;
    
    [self.view addSubview:dropDownView];
    
    [dropDownView setTitle:@"省份" inSection:0];
    [dropDownView setTitle:@"市区" inSection:1];
    [dropDownView setTitle:@"医院" inSection:2];
    [dropDownView setTitle:@"科室" inSection:3];
    
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    
    static NSString *CellIdentifier = @"DoctorListCell";
    DoctorListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[DoctorListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    /* */
    [cell setDoctorInfo:nil Bytype:_viewType];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"DoctorInfoViewController"];
    [doctorView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:doctorView animated:YES];
    
}


#pragma mark -- 重载右键点击事件
-(void)navigationRightItemEvent{
    
    NSLog(@"RigthItem ClientEvent");
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"Reservation" bundle:nil];
    
    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"ReservationViewController"];
    [doctorView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:doctorView animated:YES];
}


#pragma mark -- dropDownListDelegate
-(void) chooseAtSection:(NSInteger)section index:(NSInteger)index
{
    NSLog(@"童大爷选了section:%d ,index:%d",section,index);
}

#pragma mark -- dropdownList DataSource
-(NSInteger)numberOfSections
{
    return [chooseArray count];
}
-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSArray *arry =chooseArray[section];
    return [arry count];
}
-(NSString *)titleInSection:(NSInteger)section index:(NSInteger) index
{
    return chooseArray[section][index];
}
-(NSInteger)defaultShowSection:(NSInteger)section
{
    return 0;
}






@end
