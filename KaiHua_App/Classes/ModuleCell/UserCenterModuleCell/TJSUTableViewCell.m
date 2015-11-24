//
//  TJSUTableViewCell.m
//  KaiHua_App
//


#import "TJSUTableViewCell.h"
#import "CoinViewController.h"
#import "CoinNomalViewController.h"

@implementation TJSUTableViewCell

- (void)awakeFromNib
{
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTJSHViewFrame{
    
    // Initialization code
    /* 身高翻转视图*/
    CoinNomalViewController *coinNom_Height_View = [[CoinNomalViewController alloc] initWithNibName:@"CoinNomalViewController" bundle:nil];
    //[coinNom_Height_View setUser_Type:@"身高"];
    [coinNom_Height_View setUser_Item_ICO:[UIImage imageNamed:@"btn_Health_Profile_Height"]];
    [coinNom_Height_View.view setTag:1];
    
    
    CoinViewController *coinFlip_Height_View = [[CoinViewController alloc] initWithNibName:@"CoinViewController" bundle:nil];
   // [coinFlip_Height_View setUser_Type:@"身高"];
    [coinFlip_Height_View setCoin_Image_B:[UIImage imageNamed:@"btn_Health_Profile_Height_sel"]];
    [coinFlip_Height_View.view setTag:2];
    
    
    /* 体重翻转视图*/
    CoinNomalViewController *coinNom_Wight_View = [[CoinNomalViewController alloc] initWithNibName:@"CoinNomalViewController" bundle:nil];
   // [coinNom_Wight_View setUser_Type:@"体重"];
    [coinNom_Wight_View setUser_Item_ICO:[UIImage imageNamed:@"btn_Health_Profile_Weight"]];
    [coinNom_Wight_View.view setTag:1];
    
    CoinViewController *coinFlip_Wight_View = [[CoinViewController alloc] initWithNibName:@"CoinViewController" bundle:nil];
    [coinFlip_Wight_View setCoin_Image_B:[UIImage imageNamed:@"btn_Health_Profile_Weight_sel"]];
    [coinFlip_Wight_View.view setTag:2];
    
    
    /* 血压翻转视图*/
    CoinNomalViewController *coinNom_Blood_Press_View = [[CoinNomalViewController alloc] initWithNibName:@"CoinNomalViewController" bundle:nil];
   // [coinNom_Blood_Press_View setUser_Type:@"血压"];
    [coinNom_Blood_Press_View setUser_Item_ICO:[UIImage imageNamed:@"btn_Health_Profile_BloodPress"]];
    [coinNom_Blood_Press_View.view setTag:1];
    
    CoinViewController *coinFlip_Blood_Press_View = [[CoinViewController alloc] initWithNibName:@"CoinViewController" bundle:nil];
    [coinFlip_Blood_Press_View setCoin_Image_B:[UIImage imageNamed:@"btn_Health_Profile_BloodPress_sel"]];
    [coinFlip_Blood_Press_View.view setTag:2];
    
    /* 心率翻转视图*/
    CoinNomalViewController *coinNom_Heart_Rate_View = [[CoinNomalViewController alloc] initWithNibName:@"CoinNomalViewController" bundle:nil];
    //[coinNom_Heart_Rate_View setUser_Type:@"心率"];
    [coinNom_Heart_Rate_View setUser_Item_ICO:[UIImage imageNamed:@"health profile8"]];
    [coinNom_Heart_Rate_View.view setTag:1];
    
    CoinViewController *coinFlip_Heart_Rate_View = [[CoinViewController alloc] initWithNibName:@"CoinViewController" bundle:nil];
    [coinFlip_Heart_Rate_View setCoin_Image_B:[UIImage imageNamed:@"health profile9"]];
    [coinFlip_Heart_Rate_View.view setTag:2];
    
    
    [_view_Height setDelegate:(id)self.healthRescord];
    [_view_Height setPrimaryView:coinNom_Height_View.view];
    [_view_Height setSecondaryView:coinFlip_Height_View.view];
    [_view_Height setSpinTime:1.0];
    [_view_Height setTag:CoinType_Height];
    
    
    [_view_Weight setDelegate:(id)self.healthRescord];
    [_view_Weight setPrimaryView:coinNom_Wight_View.view];
    [_view_Weight setSecondaryView:coinFlip_Wight_View.view];
    [_view_Weight setSpinTime:1.0];
    [_view_Weight setTag:CoinType_Weight];
    
    [_view_Blood_Press setDelegate:(id)self.healthRescord];
    [_view_Blood_Press setPrimaryView:coinNom_Blood_Press_View.view];
    [_view_Blood_Press setSecondaryView:coinFlip_Blood_Press_View.view];
    [_view_Blood_Press setSpinTime:1.0];
    [_view_Blood_Press setTag:CoinType_Blood_Press];
    
    [_view_blood_Herat_Rate setDelegate:(id)self.healthRescord];
    [_view_blood_Herat_Rate setPrimaryView:coinNom_Heart_Rate_View.view];
    [_view_blood_Herat_Rate setSecondaryView:coinFlip_Heart_Rate_View.view];
    [_view_blood_Herat_Rate setSpinTime:1.0];
    [_view_blood_Herat_Rate setTag:CoinType_blood_Herat_Rate];
    
}


@end
