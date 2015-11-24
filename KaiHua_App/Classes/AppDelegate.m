//
//  AppDelegate.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//


#import "JDMenuViewController.h"
//#import "MainViewController.h"

#import "AppDelegate.h"

#import <TencentOpenAPI/TencentOAuth.h>

#import "UserloginViewController.h"
#import "NavViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    /*
    JDMenuViewController *menuController = [[JDMenuViewController alloc] init];
    self.contentController = [[MainViewController alloc] init];
    
    [menuController setMainView:_contentController];
    
    _contentController.view.backgroundColor = [UIColor colorWithHue:0.5 saturation:1.0 brightness:1.0 alpha:1.0];
    _contentController.title = @"HOME";
    
   // UIViewController *navController = [[UINavigationController alloc] initWithRootViewController:contentController];
    _sideMenu = [[JDSideMenu alloc] initWithContentController:_contentController
                                                          menuController:menuController];
    [_sideMenu setBackgroundImage:[UIImage imageNamed:@"slide_BG"]];
  //  self.window.rootViewController = sideMenu;
    
    UIStoryboard * login_SB = [UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil];
    
    UIViewController *loginView = [login_SB  instantiateViewControllerWithIdentifier:@"Login_Register_LOGIN"];
    
    _base_Nav = [[BaseNavViewController alloc] initWithRootViewController:loginView];
    [_base_Nav setBarTingColorWithColor:[UIColor colorWithRed:45/255.0 green:128/255.0 blue:249/255.0 alpha:1]];
    
    */
    
    NavViewController *navController = [[NavViewController alloc] init];
    
    self.window.rootViewController = navController;
    
  //  [self.window.rootViewController addChildViewController:_sideMenu];
  //  [self.window.rootViewController addChildViewController:_base_Nav.visibleViewController];
    
    return YES;

}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -- Tentcent QQ 登录
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}


@end
