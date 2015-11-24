//
//  NavViewController.m
//  KaiHua_App

//

#import "NavViewController.h"


@interface NavViewController ()


@property(strong,nonatomic) UIViewController *currentView;

@end

@implementation NavViewController

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScence:) name:CHANGE_SCENCE object:nil];
    
    // Do any additional setup after loading the view.
    _menuController = [[JDMenuViewController alloc] init];
    _mainController = [[MainViewController alloc] init];
    
    [_menuController setMainView:_mainController];
    
   // _mainController.view.backgroundColor = [UIColor colorWithHue:0.5 saturation:1.0 brightness:1.0 alpha:1.0];
    _mainController.title = @"HOME";
    
    // UIViewController *navController = [[UINavigationController alloc] initWithRootViewController:contentController];
//    _sideMenu = [[JDSideMenu alloc] initWithContentController:_mainController
//                                               menuController:_menuController];
//    [_sideMenu setBackgroundImage:[UIImage imageNamed:@"slide_BG"]];
    //  self.window.rootViewController = sideMenu;
    
    
    _seldMenu = [[ICSDrawerController alloc] initWithLeftViewController:_menuController
                                                                     centerViewController:_mainController];
    
    UIStoryboard * login_SB = [UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil];
    
    UIViewController *loginView = [login_SB  instantiateViewControllerWithIdentifier:@"Login_Register_LOGIN"];
    
    _base_Nav = [[BaseNavViewController alloc] initWithRootViewController:loginView];
    [_base_Nav setBarTingColorWithColor:NavigationBar_Blue_Color];
    
    [self addChildViewController:_seldMenu];

    [self addChildViewController:_base_Nav];
    
    [self.view addSubview:_base_Nav.view];
    _currentView = _base_Nav;
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

-(void)changeScence:(NSNotification *)sender{
    
    [self transitionFromViewController:_currentView
                      toViewController:_seldMenu
                              duration:0.8f
                               options:UIViewAnimationOptionTransitionFlipFromRight
                            animations:nil
                            completion:^(BOOL finished) {
                               
                                [_base_Nav willMoveToParentViewController:nil];
                                [_base_Nav removeFromParentViewController];
                                
                                _currentView = _seldMenu;
                                
                            }];
    
}


//#pragma mark - Configuring the view’s layout behavior
//
//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}
//
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
//
//#pragma mark - ICSDrawerControllerPresenting
//
//- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
//{
//    self.view.userInteractionEnabled = NO;
//}
//
//- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
//{
//    self.view.userInteractionEnabled = YES;
//}
//
//#pragma mark - Open drawer button
//
//- (void)openDrawer:(id)sender
//{
//    [self.drawer open];
//}



@end
