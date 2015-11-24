//
//  HomePage.h
//  KaiHua_App

//

#import "BaseModule.h"


@interface HomePage : BaseModule
//// 主页个人汇总信息
@property (nonatomic , copy) NSString *userId;
@property (nonatomic , copy) NSString *InquiryCount;
@property (nonatomic , copy) NSString *AppointmentCount;
@property (nonatomic , copy) NSString *ServiceRemindCount;
@property (nonatomic , copy) NSString *userGold;
@property (nonatomic , copy) NSString *bloodGlucose;
@property (nonatomic , copy) NSString *BloodPressure_High;
@property (nonatomic , copy) NSString *BloodPressure_Low;


@end
