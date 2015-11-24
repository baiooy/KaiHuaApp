//
//  DataModule.h
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "BaseModule.h"

@interface DataModule : BaseModule

@end
//
//
//// 用户信息
//@interface UserInfo : BaseModule
//@property (nonatomic , copy) NSString *userId;
//@property (nonatomic , copy) NSString *personName;
//@property (nonatomic , copy) NSString *personSex;
//@property (nonatomic , copy) NSString *userMobilePhone;
//@property (nonatomic , copy) NSString *personMaritalStatus;
//@property (nonatomic , copy) NSString *personCareer;
//@property (nonatomic , copy) NSString *personEducation;
//@property (nonatomic , copy) NSString *personBirthday;
//@property (nonatomic , copy) NSString *personIco;
//@end
//
//
//
//// 用户健康档案
//@interface HealthRecords : BaseModule
//@property (nonatomic , copy) NSString *userId;
//@property (nonatomic , copy) NSString *wasIlled;
//@property (nonatomic , copy) NSString *illedDetail;
//@property (nonatomic , copy) NSString *illHistoryOfGrandParents;
//@property (nonatomic , copy) NSString *illHistoryOfGrandparentsDetail;
//@property (nonatomic , copy) NSString *illHistroyOfParents;
//@property (nonatomic , copy) NSString *illHistroyOfParentsDetail;
//@property (nonatomic , copy) NSString *illHistoryOfBrothersAndSisters;
//@property (nonatomic , copy) NSString *illHistoryOfBrothersAndSistersDetail;
//@property (nonatomic , copy) NSString *wasAllergyed;
//@property (nonatomic , copy) NSString *allergyedDetail;
//@property (nonatomic , copy) NSString *smokingStatus;
//@property (nonatomic , copy) NSString *drankingStatus;
//@property (nonatomic , copy) NSString *drankingDaysOfMonth_Liquor;
//@property (nonatomic , copy) NSString *oneTimeDrankingHowMuch_Liquor;
//@property (nonatomic , copy) NSString *residentHigh;
//@property (nonatomic , copy) NSString *residentWeight;
//@property (nonatomic , copy) NSString *residentHeartRate;
//@property (nonatomic , copy) NSString *residentBloodPressure_High;
//@property (nonatomic , copy) NSString *residentBloodPreesure_Low;
//
//@end
//
//
///*
// *健康新闻
// */
//@interface HealthArticle : NSObject
//
//@property (nonatomic , copy) NSString *articleID;   //资讯内容ID
//@property (nonatomic , copy) NSString *content;     //资讯内容
//@property (nonatomic , copy) NSString *pictureId;   //图片ID
//
//@property (nonatomic , copy) NSString *typeID;      //资讯类型ID
//@property (nonatomic , copy) NSString *title;       //标题
//@property (nonatomic , copy) NSString *from;        //来源
//@property (nonatomic , copy) NSString *createTime;  //创建时间
//@end
//
//
//
//// 系统提醒
//@interface SystemNotice : BaseModule
//@property (nonatomic, copy) NSString *Id;
//@property (nonatomic, copy) NSString *announcementTitle;
//
//@end
//
//// 主页个人汇总信息
//@interface HomePage : BaseModule
//@property (nonatomic , copy) NSString *userId;
//@property (nonatomic , copy) NSString *InquiryCount;
//@property (nonatomic , copy) NSString *AppointmentCount;
//@property (nonatomic , copy) NSString *ServiceRemindCount;
//@property (nonatomic , copy) NSString *userGold;
//@property (nonatomic , copy) NSString *bloodGlucose;
//@property (nonatomic , copy) NSString *BloodPressure_High;
//@property (nonatomic , copy) NSString *BloodPressure_Low;
//
//@end
//
//




