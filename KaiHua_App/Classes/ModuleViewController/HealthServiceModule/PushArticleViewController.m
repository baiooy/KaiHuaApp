//
//  PushArticleViewController.m
//  KaiHua_App

//

#import "PushArticleViewController.h"
#import "HealthNewsViewController.h"


@interface PushArticleViewController ()

@property(nonatomic,strong) HealthNewsViewController *newsView;

@end


@implementation PushArticleViewController

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
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
    
    [self setViewTitle:@"慢病防治"];
    [self customerLeftNavigationBarItemWithTitle:@"取消" andImageRes:nil];
    
    [self customerRightNavigationBarItemWithTitle:@"订阅" andImageRes:nil];
    
    
    _newsView = [uSB instantiateViewControllerWithIdentifier:@"HealthNewsViewController"];
    _newsView.type = InitTypeCommend;
    
    [self addChildViewController:_newsView];
    
    [self.view addSubview:_newsView.view];
    
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

#pragma mark-- 重载基类NavigationBar 事件
-(void)backToView{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [_newsView removeFromParentViewController];
    }];
}


-(void)navigationRightItemEvent{
    
    
}


@end
