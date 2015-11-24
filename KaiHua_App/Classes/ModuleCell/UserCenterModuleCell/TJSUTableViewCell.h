//
//  TJSUTableViewCell.h
//  KaiHua_App
//

#import <UIKit/UIKit.h>
#import "CMSCoinView.h"
#import "HealthRecordsViewController.h"

typedef enum{
    CoinType_Height = 100,
    CoinType_Weight,
    CoinType_Blood_Press,
    CoinType_blood_Herat_Rate,
} CoinType;

@interface TJSUTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CMSCoinView *view_Height;

@property (weak, nonatomic) IBOutlet CMSCoinView *view_Weight;


@property (weak, nonatomic) IBOutlet CMSCoinView *view_Blood_Press;


@property (weak, nonatomic) IBOutlet CMSCoinView *view_blood_Herat_Rate;


@property (weak, nonatomic) HealthRecordsViewController *healthRescord;


-(void)setTJSHViewFrame;


@end
