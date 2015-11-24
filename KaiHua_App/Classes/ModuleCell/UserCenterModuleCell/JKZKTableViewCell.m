//
//  JKZKTableViewCell.m
//  KaiHua_App

//

#import "JKZKTableViewCell.h"

@implementation JKZKTableViewCell




-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    //控制text长度
//    if (textField.text.length > 100)
//    {
//        return NO;
//    }
    
    //结束编辑状态
    if ([string isEqualToString:@"\n"])
    {
        if ([self.delegate respondsToSelector:@selector(textChanged:cell:)])
        {
            [self.delegate textChanged:textField.text cell:self];
        }
        
        [self endEditing:YES];
        return NO;
    }
    
    return YES;
}



#pragma mark -

- (void)awakeFromNib
{
    // Initialization code
    
    [_btn_No setImage:[UIImage imageNamed:@"btn_JKDA_YES_Sel"] forState:UIControlStateSelected];
    [_btn_Yes setImage:[UIImage imageNamed:@"btn_JKDA_YES_Sel"] forState:UIControlStateSelected];
    _btnList = [NSMutableArray array] ;
    [_btnList addObject:_btn_No];
    [_btnList addObject:_btn_Yes];
    
    
    //先禁止文本框输入
    self.txf_inputTextField.enabled = NO;
    self.txf_inputTextField.tintColor = [UIColor grayColor];
    
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
    
    //允许文本框输入
    self.txf_inputTextField.enabled = YES;
    
}


- (IBAction)btn_NoEvent:(id)sender {
    
    [self init_BtnHeightEvent:_btnList];
    
    [self setBtn_HeightEvent:(UIButton *)sender];
    
    //禁止文本框输入
    self.txf_inputTextField.enabled = NO;
}



@end
