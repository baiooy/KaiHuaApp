//
//  DoctorListCell.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "DoctorListCell.h"
#import "Constant.h"


@implementation DoctorListCell

- (void)awakeFromNib
{
    // Initialization code
    [_img_Doc_Favourite setFrame:CGRectMake(262, 15, 53, 60)];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) setDoctorInfo:(NSDictionary *)dict Bytype:(int)type{
    
    switch (type) {
        case VIEW_TYPE_QA:{
            [_label_Doc_Fav_Color setBackgroundColor:[UIColor whiteColor]];
            [_img_Doc_Favourite setImage:[UIImage imageNamed:@"img_SearchDoc_Faourite"] forState:UIControlStateNormal];
        }
            
            break;
        case VIEW_TYPE_RESERVATION:{
            [_label_Doc_Fav_Color setBackgroundColor:[UIColor colorWithRed:46.0/255 green:69.0/255 blue:239.0/255 alpha:1]];
            [_img_Doc_Favourite setImage:[UIImage imageNamed:@"img_Yuyue_OK"] forState:UIControlStateNormal];
        }
            
            break;
        default:
            break;
    }
}


@end
