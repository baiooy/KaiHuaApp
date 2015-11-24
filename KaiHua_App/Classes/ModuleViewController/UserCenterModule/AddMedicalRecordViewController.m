//
//  AddMedicalRecordViewController.m
//  KaiHua_App
//
//  Created by lx on 14-7-10.
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "AddMedicalRecordViewController.h"

@interface AddMedicalRecordViewController ()

/* 背景试图*/
@property (weak, nonatomic) IBOutlet UIImageView *img_Birthday_BG;

@property (weak, nonatomic) IBOutlet UIImageView *img_Hospital_BG;

@property (weak, nonatomic) IBOutlet UIImageView *img_Doctor_BG;



/* 医生名称*/
@property (weak, nonatomic) IBOutlet UITextField *btn_Doctor_Name;
/* 医生职称*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Doctor_ZhiCheng;
/* 医生地区*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Hospital_Area;
/* 医生名称*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Hospital_Name;
/* 医生科室*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Hospital_Keshi;
/* 年份*/
@property (weak, nonatomic) IBOutlet UITextField *label_Year;
/* 月份*/
@property (weak, nonatomic) IBOutlet UITextField *label_Month;
/* 日*/
@property (weak, nonatomic) IBOutlet UITextField *label_Day;
/* 当前区域*/
@property (weak, nonatomic) IBOutlet UILabel *label_Local_Name;






@end

@implementation AddMedicalRecordViewController

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
    [self setViewTitle:@"添加病历"];
    [self customerLeftNavigationBarItemWithTitle:@"取消" andImageRes:nil];
    [self customerRightNavigationBarItemWithTitle:@"完成" andImageRes:nil];
    
    [self initlayoutControls];
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

-(void)initlayoutControls{
  
    [self.img_Birthday_BG setImage:IMG_White_Btn_BG];
    [self.img_Doctor_BG setImage:IMG_White_Btn_BG];
    [self.img_Hospital_BG setImage:IMG_White_Btn_BG];
    
    [self.btn_Hospital_Area setImage:[UIImage imageNamed:@"img_MR_ZhiCheng"] forState:UIControlStateNormal];
     [self.btn_Hospital_Name setImage:[UIImage imageNamed:@"img_MR_ZhiCheng"] forState:UIControlStateNormal];
     [self.btn_Hospital_Keshi setImage:[UIImage imageNamed:@"img_MR_ZhiCheng"] forState:UIControlStateNormal];
    [self.btn_Hospital_Area setImageEdgeInsets:UIEdgeInsetsMake(0, _btn_Hospital_Area.frame.size.width -15, 0, 5)];
    [self.btn_Hospital_Name setImageEdgeInsets:UIEdgeInsetsMake(0, _btn_Hospital_Name.frame.size.width -15, 0, 5)];
    [self.btn_Hospital_Keshi setImageEdgeInsets:UIEdgeInsetsMake(0, _btn_Hospital_Keshi.frame.size.width -15, 0, 5)];
    
    [self.btn_Doctor_ZhiCheng setImageEdgeInsets:UIEdgeInsetsMake(0, _btn_Doctor_ZhiCheng.frame.size.width -15, 0, 5)];

}

#pragma mark -- 切换地区
- (IBAction)btn_Change_Area:(id)sender {
}

#pragma mark -- 区域选择
- (IBAction)btn_AreaEvent:(id)sender {
}

#pragma mark -- 选择医院
- (IBAction)btn_hospitaiEvent:(id)sender {
}

#pragma mark -- 选择科室
- (IBAction)btn_KaishiEvent:(id)sender {
}

#pragma mark -- 选择职称
- (IBAction)btn_ZhichengEvent:(id)sender {
}

#pragma mark -- 添加病历报告
- (IBAction)btn_Add_MR_Event:(id)sender {
}

#pragma mark -- 选择日期
- (IBAction)btn_DataEvent:(id)sender {
}





#pragma mark -- 重载 UINavigationBar 左 右键事件
-(void)backToView{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)navigationRightItemEvent{
    
}



@end
