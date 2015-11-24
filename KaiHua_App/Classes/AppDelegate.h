//
//  AppDelegate.h
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "JDSideMenu.h"
#import "BaseNavViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic) MainViewController *contentController;

@property(strong,nonatomic) JDSideMenu *sideMenu;

@property(strong,nonatomic) BaseNavViewController *base_Nav;

@end
