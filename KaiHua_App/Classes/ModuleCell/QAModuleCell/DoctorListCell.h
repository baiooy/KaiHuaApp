//
//  DoctorListCell.h
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorListCell : UITableViewCell

/* 头像*/
@property (weak, nonatomic) IBOutlet UIImageView *img_Doc_Ico;
/* 名称*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doc_Name;
/* 职称*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doc_Zhicheng;
/* 介绍*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doc_Introduce;
/* 医院*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doc_Hospital;
/* 收藏标志*/
@property (weak, nonatomic) IBOutlet UIButton *img_Doc_Favourite;
/* 收藏标示颜色条*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doc_Fav_Color;


-(void) setDoctorInfo:(NSDictionary *)dict Bytype:(int)type;





@end
