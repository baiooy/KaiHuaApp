//
//  CoinViewController.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "CoinViewController.h"
#import "BaseLabel.h"

@interface CoinViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image_Item_ICO;

@property (weak, nonatomic) IBOutlet BaseLabel *label_UserValues;

@property (weak, nonatomic) IBOutlet BaseLabel *label_UserType;

@end

@implementation CoinViewController

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
    [_image_Item_ICO setImage:_coin_Image_B];
    [_label_UserValues setText:_user_Values];
    [_label_UserType setText:_user_Type];
    
    
}

-(void)awakeFromNib{
    
  //  [_label_UserValues setTextAlignment:NSTextAlignmentCenter];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
