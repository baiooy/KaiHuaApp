//
//  UserInfo.h
//  KaiHua_App


#define UserInfo_UserID @"userId"
#define UserInfo_personName @"personName"
#define UserInfo_personSex @"personSex"
#define UserInfo_userMobilePhone @"userMobilePhone"
#define UserInfo_personMaritalStatus @"personMaritalStatus"
#define UserInfo_personCareer @"personCareer"
#define UserInfo_personEducation @"personEducation"
#define UserInfo_personBirthday @"personBirthday"
#define UserInfo_personIco @"personIco"



#import "BaseModule.h"

@interface UserInfo : BaseModule

@property (nonatomic , copy) NSString *userId;
@property (nonatomic , copy) NSString *personName;
@property (nonatomic , copy) NSString *personSex;
@property (nonatomic , copy) NSString *userMobilePhone;
@property (nonatomic , copy) NSString *personMaritalStatus;
@property (nonatomic , copy) NSString *personCareer;
@property (nonatomic , copy) NSString *personEducation;
@property (nonatomic , copy) NSString *personBirthday;
@property (nonatomic , copy) NSString *personIco;
@end
