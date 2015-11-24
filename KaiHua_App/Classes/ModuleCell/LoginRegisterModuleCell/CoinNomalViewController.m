//
//  CoinNomalViewController.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "CoinNomalViewController.h"

@interface CoinNomalViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *image_Item_ICOIB;

@property (weak, nonatomic) IBOutlet UILabel *user_Type_ValueIB;


@end

@implementation CoinNomalViewController

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
    // Do any additional setup after loading the view from its nib.
    
    [_image_Item_ICOIB setImage:_user_Item_ICO];
  //  _user_Type_ValueIB.text = _user_Type;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
