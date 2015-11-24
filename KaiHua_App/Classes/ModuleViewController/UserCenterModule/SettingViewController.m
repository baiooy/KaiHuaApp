//
//  SettingViewController.m
//  KaiHua_App

//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn_Logout;



@end

@implementation SettingViewController

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
    [self setViewTitle:@"设置"];
    // [self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    [self.btn_Logout setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateNormal];
    [self.btn_Logout setBackgroundImage:IMG_BLUE_Btn_BG forState:UIControlStateHighlighted];
    
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
#pragma mark -- switchChangeEvent
- (IBAction)switchChangeEvent:(id)sender {
    
}




@end
