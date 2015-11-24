//
//  NavViewController.h
//  KaiHua_App
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "BaseNavViewController.h"
#import "MainViewController.h"
#import "JDMenuViewController.h"

@interface NavViewController : UIViewController


//@property(weak,nonatomic) ICSDrawerController *drawer;

@property(strong,nonatomic) BaseNavViewController *base_Nav;
@property(strong,nonatomic) JDMenuViewController *menuController;
@property(strong,nonatomic) MainViewController *mainController ;

@property(strong,nonatomic) ICSDrawerController *seldMenu;


@end
