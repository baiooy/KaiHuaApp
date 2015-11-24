//
//  HealthRecords.h
//  KaiHua_App

//

#import "BaseModule.h"

@interface HealthRecords : BaseModule

@property (nonatomic , copy) NSString *userId;
@property (nonatomic , copy) NSString *wasIlled;
@property (nonatomic , copy) NSString *illedDetail;
@property (nonatomic , copy) NSString *illHistoryOfGrandParents;
@property (nonatomic , copy) NSString *illHistoryOfGrandparentsDetail;
@property (nonatomic , copy) NSString *illHistroyOfParents;
@property (nonatomic , copy) NSString *illHistroyOfParentsDetail;
@property (nonatomic , copy) NSString *illHistoryOfBrothersAndSisters;
@property (nonatomic , copy) NSString *illHistoryOfBrothersAndSistersDetail;
@property (nonatomic , copy) NSString *wasAllergyed;
@property (nonatomic , copy) NSString *allergyedDetail;
@property (nonatomic , copy) NSString *smokingStatus;
@property (nonatomic , copy) NSString *drankingStatus;
@property (nonatomic , copy) NSString *drankingDaysOfMonth_Liquor;
@property (nonatomic , copy) NSString *oneTimeDrankingHowMuch_Liquor;
@property (nonatomic , copy) NSString *residentHigh;
@property (nonatomic , copy) NSString *residentWeight;
@property (nonatomic , copy) NSString *residentHeartRate;
@property (nonatomic , copy) NSString *residentBloodPressure_High;
@property (nonatomic , copy) NSString *residentBloodPreesure_Low;


@end
