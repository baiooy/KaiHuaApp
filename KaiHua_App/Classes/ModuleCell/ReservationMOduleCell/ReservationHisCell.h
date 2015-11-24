//
//  ReservationHisCell.h
//  KaiHua_App
//

#import <UIKit/UIKit.h>
#import "CMSCoinView.h"

#import "ReservationDoctorView.h"
#import "ReservationPatientView.h"

@interface ReservationHisCell : UITableViewCell<CoinViewDelegate>
{
    //医生view
    ReservationDoctorView *view_doctorView;
    
    //病人view
    ReservationPatientView *view_patientView;
}

//用来翻转的view
@property (nonatomic , strong) CMSCoinView *coinView;

//以后要用医生和病人的实体初始化 给view上的控件赋值
-(void) initCoinView;

@end
