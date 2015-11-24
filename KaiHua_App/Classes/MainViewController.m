//
//  MainViewController.m
//  JDSideMenu
//
//  Created by lx on 14-6-16.
//  Copyright (c) 2014年 Markus Emrich. All rights reserved.
//

#import "BaseNavViewController.h"
#import "MainViewController.h"

#import "IndexHealthServerController.h"
#import "IndexHomeController.h"
#import "IndexQAController.h"
#import "DoctorListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)init
{
    self = [super init];
    
    if (self) {
        [self initTabBarItem];
        self.tabBar.tintColor = [UIColor colorWithRed:43/255.0f green:123/255.0f blue:223/255.0f alpha:1.0f];
        self.tabBar.translucent = NO;
        
       // self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbarbg.png"];
       // self.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"itembg.png"];
        //        self.tabBar.selectedItem.image = [UIImage imageNamed:@"itembg.png"];
        //        self.tabBarItem.finishedSelectedImage = [UIImage imageNamed:@"home.png"];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openDrawer:) name:@"SHOWMENU" object:nil];
    }
    return self;
    
}


- (void)initTabBarItem
{
    
    
   // IndexHomeController *homeView = [[IndexHomeController alloc]init];
    
    UIStoryboard *home_SB = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    UIViewController *home_ViewControl =  [home_SB instantiateViewControllerWithIdentifier:@"ROOT_HOME"];
    
    BaseNavViewController *navHome = [[BaseNavViewController alloc]initWithRootViewController:home_ViewControl];
    [navHome setBarBackGroundWithImage:NavigationBar_HomePage_IMG];
    home_ViewControl.title = @"KaiHua Healthy";
    navHome.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_Item_Home"] selectedImage:[UIImage imageNamed:@"tab_Item_Home_Sel"]];
    
    
    UIStoryboard *reservation_SB = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    DoctorListViewController *reservationView =  [reservation_SB instantiateViewControllerWithIdentifier:@"DoctorListViewController"];
    
    reservationView.viewType = VIEW_TYPE_RESERVATION;
    BaseNavViewController *navReservation = [[BaseNavViewController alloc]initWithRootViewController:reservationView];
    [navReservation setBarBackGroundWithImage:NavigationBar_ReserVation_IMG];
    reservationView.title = @"约专家";
    //messageView.tabBarItem.image = [UIImage imageNamed:@"message.png"];
   // reservationView.tabBarItem.badgeValue = @"99";
   // [reservationView.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"message_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"message.png"]];
    navReservation.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"约专家" image:[UIImage imageNamed:@"tab_Item_Reservation"] selectedImage:[UIImage imageNamed:@"tab_Item_Reservation_Sel"]];
    

    
    UIStoryboard *qa_SB = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    UIViewController *qaView =  [qa_SB instantiateViewControllerWithIdentifier:@"ROOT_QA"];
    
    BaseNavViewController *navQA = [[BaseNavViewController alloc]initWithRootViewController:qaView];
    [navQA setBarBackGroundWithImage:NavigationBar_QA_IMG];
    qaView.title = @"问医生";
    qaView.tabBarItem.image = [UIImage imageNamed:@"friend.png"];
    qaView.tabBarItem.tag = 100;
     navQA.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"问医生" image:[UIImage imageNamed:@"tab_Item_QA"] selectedImage:[UIImage imageNamed:@"tab_Item_QA_Sel"]];
  
  
    UIStoryboard *healthService_SB = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
    UIViewController *healthServerView =  [healthService_SB instantiateViewControllerWithIdentifier:@"ROOT_HEALTHSERVICE"];

    BaseNavViewController *navhealthServer= [[BaseNavViewController alloc]initWithRootViewController:healthServerView];
    [navhealthServer setBarBackGroundWithImage:NavigationBar_HealthService_IMG];
    healthServerView.title = @"健康服务";
    healthServerView.tabBarItem.image = [UIImage imageNamed:@"search.png"];
   // [healthServerView.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"search_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"search.png"]];
    navhealthServer.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"健康服务" image:[UIImage imageNamed:@"tab_Item_HealthServer"] selectedImage:[UIImage imageNamed:@"tab_Item_HealthServer_Sel"]];
    
    
    self.viewControllers = [NSArray arrayWithObjects:navHome, navReservation, navQA, navhealthServer, nil];
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    UINavigationController *viewControllers = (UINavigationController *)viewController;
    
    if(tabBarController.selectedIndex == 2){
        NSLog(@"---  %@", viewControllers.visibleViewController);
        //        [self judgeMenberIsLogin];
    }
    
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
  
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // [self customerNavigationBarItem];
    
    self.title = @"首页";
    self.delegate = self;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Configuring the view’s layout behavior

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;

}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

#pragma mark - Open drawer button



- (void)openDrawer:(id)sender
{
    [self.drawer open];
    
}



@end
