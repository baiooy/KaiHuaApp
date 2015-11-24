//
//  AddQuestionViewController.m
//  KaiHua_App
//
//  Created by lx on 14-7-11.
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "AddQuestionViewController.h"

@interface AddQuestionViewController ()

/* 病历滚动视图*/
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_AddImage;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll_Add_BingLi;


/* 添加病历*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Add_Bingli;

/* 添加图片*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Add_Image;

/* 标签*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Mark;

@property (weak, nonatomic) IBOutlet BaseLabel *label_Mark;


@end

@implementation AddQuestionViewController

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
    [self.view setBackgroundColor:[UIColor whiteColor]];

    
    //[self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    // 自定义右边键
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
 
    [self initFrameContorls];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initFrameContorls{
   
    NSString *viewTitle;
    viewTitle = [NSString stringWithFormat:@"%@",(_viewType == VIEW_TYPE_QA) ? @"提问题" : @"约专家"];
    [self setViewTitle:viewTitle];
    
    NSString *imgMark  = [NSString stringWithFormat:@"%@",(_viewType == VIEW_TYPE_QA) ? @"btn_Ask_Tips" : @"Demo_Img_Doctor_Ico"];
    
    [_btn_Mark setImage:[UIImage imageNamed:imgMark] forState:UIControlStateNormal];
    
    
    NSString *markName  = [NSString stringWithFormat:@"%@",(_viewType == VIEW_TYPE_QA) ? @"选择标签" : @"张志"];
    [_label_Mark setText:markName];
    [_label_Mark setTextAlignment:NSTextAlignmentCenter];
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
#pragma mark -- 增加图像
- (IBAction)btnAddImageEvent:(id)sender {
}

#pragma mark -- 增加病历
- (IBAction)btnAddBingLiEvent:(id)sender {
}





@end
