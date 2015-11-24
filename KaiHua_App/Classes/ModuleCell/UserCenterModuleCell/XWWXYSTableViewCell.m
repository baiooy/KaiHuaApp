//
//  XWWXYSTableViewCell.m
//  KaiHua_App
//


#import "XWWXYSTableViewCell.h"

@implementation XWWXYSTableViewCell

- (void)awakeFromNib
{
    // Initialization code
    [_btn_No setImage:[UIImage imageNamed:@"btn_JKDA_YES_Sel"] forState:UIControlStateSelected];
    [_btn_Yes setImage:[UIImage imageNamed:@"btn_JKDA_YES_Sel"] forState:UIControlStateSelected];
    
    _btnList = [NSMutableArray array] ;
    [_btnList addObject:_btn_No];
    [_btnList addObject:_btn_Yes];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark -- 是否 选择事件
-(void)setBtn_HeightEvent:(UIButton *)btn{
    
    if (btn.tag == 0){
        [btn setSelected:YES];
        [btn setTag:1];
    } else {
        [btn setTag:0];
        [btn setSelected:NO];
        
    }
}


/* 初始化 按钮状态*/
-(void)init_BtnHeightEvent:(NSMutableArray *)list{
    
    for (NSObject *obj in list) {
        UIButton *btn = (UIButton *)obj;
        if(btn.selected == YES){
            btn.selected = NO;
            btn.tag = 0;
        }
    }
}

- (IBAction)btn_YesEvent:(id)sender {
    
    [self init_BtnHeightEvent:_btnList];
    
    [self setBtn_HeightEvent:(UIButton *)sender];
    
}


- (IBAction)btn_NoEvent:(id)sender {
    
    [self init_BtnHeightEvent:_btnList];
    
    [self setBtn_HeightEvent:(UIButton *)sender];
}




@end
