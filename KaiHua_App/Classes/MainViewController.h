//
//  MainViewController.h
//  JDSideMenu
//
//  Created by lx on 14-6-16.
//  Copyright (c) 2014年 Markus Emrich. All rights reserved.
//

#import "BaseViewController.h"
#import "ICSDrawerController.h"

@interface MainViewController :UITabBarController <ICSDrawerControllerPresenting,ICSDrawerControllerChild,UITabBarControllerDelegate>

@property(weak,nonatomic) ICSDrawerController *drawer;


@end
