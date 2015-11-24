//
//  JDMenuViewController.m
//  JDSideMenu
//
//  Created by Markus Emrich on 11.11.13.
//  Copyright (c) 2013 Markus Emrich. All rights reserved.
//
#import "Constant.h"


#import "JDMenuViewController.h"

#import "UserSettingViewController.h"

#import "FrameViewCell.h"



@interface JDMenuViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong ,nonatomic) NSArray *menuList;
@property(nonatomic, assign) NSInteger previousRow;

@end

@implementation JDMenuViewController

- (void)viewDidLayoutSubviews;
{
    [super viewDidLayoutSubviews];
     _menuList = [self loadMenuData];
    _previousRow = -1;
}



- (IBAction)switchController:(id)sender;
{
    
//    MainViewController * mainViewController;
//    if (_MainView){
//        
//        mainViewController = self.MainView;
//    }else{
//      
//        mainViewController = [[MainViewController alloc] init];
//    }
//    
//     UINavigationController *navSelect = (UINavigationController *)[mainViewController selectedViewController];
//    
//    NSLog(@"---  %@", navSelect.visibleViewController);
//    [navSelect popViewControllerAnimated:NO];
//    UserSettingViewController *userSetingView = [[UserSettingViewController alloc] initWithNibName:@"UserSettingViewController" bundle:nil];
//    [navSelect pushViewController:userSetingView animated:YES];
//    
//    // UIViewController *contentController = [[UINavigationController alloc] initWithRootViewController:viewController];
//    [self.sideMenuController setContentController:mainViewController animated:YES];
    
}

/* 生成菜单内容*/

-(NSArray *)loadMenuData{
    
    NSArray *menuList ;
    
    NSDictionary *localDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LocalData" ofType:@"plist"]];
                              
                              
    menuList  = [localDict objectForKey:@"Menu_Data"];
    
    return menuList;
}


#pragma mark UITableViewDelagate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _menuList.count;
}


-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 44;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIndentifier = @"FrameViewCell";
    
    FrameViewCell *cell = (FrameViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if (cell ==  nil) {
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:CellIndentifier
                                                  owner:self
                                                options:nil];
        cell=[nib objectAtIndex:0];
    }
    
    int celNum = indexPath.row;
    
    if ((celNum < _menuList.count) && (_menuList.count > 0)){
        
        NSDictionary *menuDict = [_menuList objectAtIndex:indexPath.row];
        
        [cell.menu_Ico setImage:[UIImage imageNamed:[menuDict objectForKey:@"ico"]]];
        [cell.menu_Name setText:[menuDict objectForKey:@"name"]];
        [cell.menu_Name setFont:FontOthers_CH(14)];
        
    }
    
    // 设置Cell背景选中颜色
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = SlideMenu_Color;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.previousRow) {
        // Close the drawer without no further actions on the center view controller
        [self.drawer close];
    }
    else {
        
        // 点击事件
        NSDictionary *menu_Dict = [_menuList objectAtIndex:indexPath.row];
        
        NSString *storyBoard = [menu_Dict objectForKey:@"tag"];
        
        if ([storyBoard isEqualToString:@""]){
            
            [[CommonFunc shareInstance] showHintMessage:@"正在拼命赶进度.."];
            return;
        }
        
        
        UIStoryboard *home_SB = [UIStoryboard storyboardWithName:storyBoard bundle:nil];
        UIViewController *home_ViewControl =  [home_SB instantiateViewControllerWithIdentifier:[menu_Dict objectForKey:@"respons_class"]];
        
        // 取得当前菜单关联的类
        // NSObject *obj = [[NSClassFromString([menu_Dict objectForKey:@"respons_class"]) alloc] init];
        
        MainViewController * mainViewController;
        if (_MainView){
            
            mainViewController = self.MainView;
        }else{
            
            mainViewController = [[MainViewController alloc] init];
        }
        
        UINavigationController *navSelect = (UINavigationController *)[mainViewController selectedViewController];
        
        NSLog(@"---  %@", navSelect.visibleViewController);
        [navSelect popViewControllerAnimated:NO];
       
        
        // UIViewController *contentController = [[UINavigationController alloc] initWithRootViewController:viewController];
        //[self.sideMenuController setContentController:mainViewController animated:NO];
       // [self.drawer replaceCenterViewControllerWithViewController:mainViewController];
        
        [self.drawer reloadCenterViewControllerUsingBlock:^{
           
             home_ViewControl.hidesBottomBarWhenPushed = YES;
            [navSelect pushViewController:(UIViewController *)home_ViewControl animated:NO];
            [self.drawer.centerViewController setView:mainViewController.view];
        }];
        
      //  home_ViewControl.hidesBottomBarWhenPushed = YES;
      //  [navSelect pushViewController:(UIViewController *)home_ViewControl animated:YES];
       
        
        
    }
    
    
 
     self.previousRow = indexPath.row;
    
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UIViewController *distinaionView = segue.destinationViewController;
    [distinaionView setHidesBottomBarWhenPushed:YES];
    
}


#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}



@end
