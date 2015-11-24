//
//  FadebackViewController.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "FadebackViewController.h"

@interface FadebackViewController ()

/* 提交按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Commit;



@end

@implementation FadebackViewController

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
    [self setViewTitle:@"意见反馈"];
     
    //[self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    [self.btn_Commit setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateNormal];
    [self.btn_Commit setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateHighlighted];
    
    
    
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

@end
