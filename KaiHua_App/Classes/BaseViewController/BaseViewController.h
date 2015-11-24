//
//  BaseViewController.h
//  JDSideMenu
//
//  Created by lx on 14-6-16.
//  Copyright (c) 2014年 Markus Emrich. All rights reserved.
//

#import "RootViewController.h"
#import "ICSDrawerController.h"
#import "BaseButton.h"
#import "BaseLabel.h"
#import "BaseTextField.h"
#import "BaseTextView.h"


@interface BaseViewController : RootViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

//-(void)customerRightNavigationBarItemWithTitle:(NSString *)title andImageRes:(NSString *)resName;
//(void)rightBtnEvent;

-(void)setMenuBtnItemWithTitle:(NSString *)title andImageRes:(NSString *)resName;

-(void)customerBaseViewRightNavigationBarItemWithTitle:(NSString *)title andImageRes:(NSString *)resName;

@property(nonatomic, weak) ICSDrawerController *drawer;

@end
