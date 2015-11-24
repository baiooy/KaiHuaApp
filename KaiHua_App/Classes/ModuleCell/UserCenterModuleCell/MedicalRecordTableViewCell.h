//
//  MedicalRecordTableViewCell.h
//  KaiHua_App

//

#import <UIKit/UIKit.h>

@interface MedicalRecordTableViewCell : UITableViewCell

/* 医生头像*/
@property (weak, nonatomic) IBOutlet UIButton *btnDoctorIco;
/* 医生名称*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_Name;

/* 医生职称*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_ZhiCheng;

/* 医院*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_Hostpical;
/* 医生科室*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_KaiShi;
/* 病历1*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_BL1_Num;
/* 病历1*/
@property (weak, nonatomic) IBOutlet UILabel *label_Doctor_Bl2_Num;

/* 科室缩略图*/
@property (weak, nonatomic) IBOutlet UIImageView *label_Doctor_KaiShi_Ico;


@end
