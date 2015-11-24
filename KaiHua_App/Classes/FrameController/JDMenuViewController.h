//
//  JDMenuViewController.h
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "ICSDrawerController.h"

@interface JDMenuViewController : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property(nonatomic,strong) MainViewController *MainView;

@property (weak, nonatomic) IBOutlet UITableView *MenuTableView;


@property(weak,nonatomic) ICSDrawerController *drawer;
@end
