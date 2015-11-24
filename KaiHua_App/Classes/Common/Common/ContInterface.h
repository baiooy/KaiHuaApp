//
//  ContInterface.h
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#ifndef KaiHua_App_ContInterface_h
#define KaiHua_App_ContInterface_h

/* 接口参数定义*/
// 接口地址
#pragma mark-- 登陆注册

#define SIGNATURE @"signature"
#define DEVICE_TOKEN @"deviceToken"
#define ACCESS_TOKEN @"access_token"
#define CODE @"code"
#define ERROR @"error"


/* =======================================================================================*/
/* 7.1.1.	登录—— 验证*/
#define UserName @"username"
#define Password @"password"
#define FUN_USER_LOGIN [SERVER_ADDRESS stringByAppendingString:@"/security/login"]

/* 7.1.2.	登录——登录按钮进入主页*/
#define User_ID @"user_Id"
#define FUN_HOME_PAGE_INFO [INTERFACE_ADDRESS stringByAppendingString:@"queryUserHomePageInfo"]

/* 7.1.3.	注册*/
#define PersonName @"personName"
#define PersonSex @"personSex"
#define PersonBirthday @"personBirthday"
#define UserMobilePhone @"userMobilePhone"
#define HeadSculpture @"headSculpture"
#define VerificationCode @"verificationCode"
#define DeviceToken @"deviceToken"
#define FUN_USER_REGISTER [INTERFACE_ADDRESS stringByAppendingString:@"register"]

/* 7.1.4.	注册——找回密码*/
#define Reg_UserID @"userId"
#define Reg_Phone @"phone"
#define VerifficationCode @"verificationCode"
#define NewPwd @"newPwd"
#define FUN_USER_FORGOT_PWD [INTERFACE_ADDRESS stringByAppendingString:@"updateForgotPassword"]

/* 7.1.5.	注册——获取手机验证码*/
#define UserMbilePhone @"userMobilePhone"
#define FUN_USER_VERIFICATION_CODE [INTERFACE_ADDRESS stringByAppendingString:@"queryVerificationCode"]


#pragma mark-- 问答模块
/* =======================================================================================*/
/* 7.1.6.	问医生——用户快速提问（免费提问）*/
#define FUN_ADD_USERQUESTION_DATA [INTERFACE_ADDRESS stringByAppendingString:@"saveAskQuesions"]

/* 7.1.7.	问医生——会员通过查找医生页面发起提问 -----7.1.8.	问医生——会员通过私人医生页面发起提问*/
#define FUN_ADD_ASKQUESTION [INTERFACE_ADDRESS stringByAppendingString:@"saveAskQuestion"]

/* 7.1.9.	问医生——查询问医生记录列表*/
#define FUN_GET_QUESTION_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryQuestionsList"]

/* 7.1.10.	问医生——问医生记录详情*/
#define FUN_GET_ASK_QUESTION_DETAIL_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryAskQuestionsDetailList"]

/* 7.1.11.	问医生——查询医生列表*/
#define FUN_GET_DOCTOR_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryDoctorsList"]

/* 7.1.12.	问医生——我的私人医生按钮查询私人医生列表*/
#define FUN_GET_PRIVATE_DOTCORLIST [INTERFACE_ADDRESS stringByAppendingString:@"queryPrivateDoctors"]

/* 7.1.13.	问医生——医生简介-----7.1.14.	问医生——查看私人医生详细*/
#define FUN_GET_DOCTOR_INTRODUCE [INTERFACE_ADDRESS stringByAppendingString:@"queryDoctorIntroduce"]

/* 7.1.15.	问医生——医生简介页面确认私人医生*/
#define FUN_ADD_PRIVATE_DOCTOR_CONFIRM [INTERFACE_ADDRESS stringByAppendingString:@"savePrivateDoctorConfirm"]

/* 7.1.16.	问医生——医生简介页面取消私人医生*/
#define FUN_UPDATE_PRIVATE_DOCTOR_REVOKE [INTERFACE_ADDRESS stringByAppendingString:@"savePrivateDoctorRevoke"]

/* 7.1.17.	问医生——医生简介页面点收藏*/
#define FUN_ADD_FAVOURITE [INTERFACE_ADDRESS stringByAppendingString:@"saveFavorate"]

/* 7.1.18.	问医生——评价医生*/
#define FUN_ADD_DOCTOR_EVALUATE [INTERFACE_ADDRESS stringByAppendingString:@"saveDoctorEvaluate"]

/* 7.1.48.	问医生——（级联查询 选中省市和区来过滤查询医院）*/
#define FUN_GETHOSPITAL_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryHospitalList"]

/* 7.1.49.	问医生——（问题回复）*/
#define FUN_ADD_RELAY_QUESTION [INTERFACE_ADDRESS stringByAppendingString:@"saveReplyQuesions"]


#pragma mark-- 主页
/* =======================================================================================*/
/* 7.1.19.	主页——（初始化显示）*/
#define FUN_GET_HOME_INFO [INTERFACE_ADDRESS stringByAppendingString:@"queryHomePageInfo"]

/* 7.1.20.	主页——（公告	） */
#define ANNOUNCEMENT_UserID @"userId"
#define FUN_GET_ANNOUNCEMENT_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryAnnouncementList"]

/* 7.1.21.	主页——（点击血糖，血压，心律，步数看趋势图*/
#define FUN_GET_HEALTH_INDICATOR [INTERFACE_ADDRESS stringByAppendingString:@"queryHealthIndicator"]


/* =======================================================================================*/
#pragma mark-- 约专家
/* 7.1.22.	约专家——（可以看到全部预约历史记录）----- 7.1.23.	约专家——（看到所有医生以及是否被预约过，包含查询条件过滤）*/
#define FUN_GET_DOCTOR_APPOINTMENT [INTERFACE_ADDRESS stringByAppendingString:@"queryDoctorAppointment"]

/* 77.1.24.	约专家——（引病历按钮）*/
#define FUN_GET_MEDICALIST [INTERFACE_ADDRESS stringByAppendingString:@"queryMedicalList"]

/* 7.1.25.	约专家——（提交按钮）*/
#define FUN_ADD_SPECIAL_LIST_APPOINTMENT [INTERFACE_ADDRESS stringByAppendingString:@"saveSpecialistAppointment"]

/* 7.1.26.	约专家——（确定取消预约按钮）*/
#define FUN_UPDATE_SPECAILIST_APPOINTMENT [INTERFACE_ADDRESS stringByAppendingString:@"updateSpecialistAppointment"]


/* =======================================================================================*/
#pragma mark--个人信息设置
/* 7.1.27.	个人信息设置¬——（我的基本信息）----7.1.28.	个人信息设置¬——（我的健康档案）*/
#define FUN_GET_USER_INFO [INTERFACE_ADDRESS stringByAppendingString:@"queryUserInfo"]

/* 7.1.29.	个人信息设置——（基本信息提交按钮）*/
#define FUN_ADD_USER_INFO [INTERFACE_ADDRESS stringByAppendingString:@"saveUserInfo"]

/* 7.1.30.	个人信息设置——（设置里面的5个按钮）*/
#define FUN_UPDATE_USER_INFO [INTERFACE_ADDRESS stringByAppendingString:@"updateUserInfo"]

/* 7.1.31.	个人信息设置——（健康档案提交按钮）*/
#define FUN_ADD_HEALTH_RECORDS_INFO [INTERFACE_ADDRESS stringByAppendingString:@"saveHealthRecordsInfo"]

/* 7.1.32.	个人信息设置——（我的病历）*/
#define FUN_GET_MEDICALINFO_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryMedicalInfoList"]

/* 7.1.33.	个人信息设置——（添加病历）*/
#define FUN_ADD_MEDICAL_INFO [INTERFACE_ADDRESS stringByAppendingString:@"saveMedicalInfo"]

/* 7.1.34.	个人信息设置——（病历详细）*/
#define FUN_GET_MEDICAL_DETAIL [INTERFACE_ADDRESS stringByAppendingString:@"queryMedicalDetail"]

/* 7.1.35.	个人信息设置——（设置按钮）*/
#define FUN_GET_USERSET_INFO [INTERFACE_ADDRESS stringByAppendingString:@"queryUserSetInfo"]

/* 7.1.36.	个人信息设置——（修改密码按钮）*/
#define FUN_RESERT_PWD [INTERFACE_ADDRESS stringByAppendingString:@"resetPassword"]

/* 7.1.37.	个人信息设置——（收藏医生，问答，资讯）*/
#define FUN_GET_USER_FAOURITE [INTERFACE_ADDRESS stringByAppendingString:@"queryUserFavorite"]

/* 7.1.38.	个人信息设置——意见反馈*/
#define FUN_ADD_FEEDBACK [INTERFACE_ADDRESS stringByAppendingString:@"feedback"]

/* 7.1.39.	个人信息设置——退出登录*/
#define FUN_LOGOUT [SERVER_ADDRESS stringByAppendingString:@"/security/logout"]

/* 7.1.40.	个人信息设置——（选择疾病库）*/
#define FUN_GET_ICD_DESCRIBE_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryIcdDescribeList"]


/* =======================================================================================*/
#pragma mark--健康服务页面
/* 7.1.41.	健康服务页面——（首页健康服务按钮显示定制项目）*/
#define FUN_GET_COSTOMIZED_HEALTH_SERVICE_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryCostomizedHealthService"]

/* 7.1.42.	健康服务页面——（首页健康服务按钮显示内容）*/
#define FUN_GETCUSTOMIZED_HEALTH_SERVICE_DETAIL [INTERFACE_ADDRESS stringByAppendingString:@"queryCostomizedHealthServiceDetail"]

/* 7.1.43.	健康服务页面——（服务提醒按钮）*/
#define FUN_GET_HEALTH_REMIND_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryHealthRemind"]

/* 7.1.44.	健康服务页面——（资讯明细）*/
#define FUN_GET_HEALTH_CONSULTATION_DETAIL [INTERFACE_ADDRESS stringByAppendingString:@"queryHealthConsultationDetail"]

/* 7.1.45.	健康服务页面——（资讯一览	）*/
#define FUN_GET_HEALTH_CONSULTATION_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryHealthConsultationList"]

/* 7.1.46.	健康服务页面——（资讯一览	弹出页面）*/
#define FUN_GET_HEALHT_CONSULTATION_TITLE_LIST [INTERFACE_ADDRESS stringByAppendingString:@"queryHealthConsultationTitleList"]

/* 7.1.47.	健康服务页面——确认健康提醒按钮*/
#define FUN_ADD_CONSULATION_REMIND_CONFIRM [INTERFACE_ADDRESS stringByAppendingString:@"saveConsultationRemindConfirm"]

/* 7.1.51.	健康服务页面——资讯定制*/
#define FUN_ADD_INFORMATION [INTERFACE_ADDRESS stringByAppendingString:@"saveInformation"]


/* =======================================================================================*/
#pragma mark--我的收藏
/* 7.1.50.	我的收藏——医生收藏列表*/
#define FUN_GET_FAOURITE_DOCTTORS [INTERFACE_ADDRESS stringByAppendingString:@"queryFavoriteDoctors"]




#endif
