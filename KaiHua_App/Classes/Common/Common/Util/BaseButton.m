//
//  BaseButton.m
//  KaiHua_App
//
//  Created by kaihua on 14-7-23.
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "BaseButton.h"
#import "Constant.h"

@implementation BaseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)awakeFromNib
{
    self.titleLabel.font = FontOthers_CH(self.titleLabel.font.pointSize);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:UIControlStateNormal];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 4;
    
    NSDictionary *attributes = @{ NSFontAttributeName:FontOthers_CH(self.titleLabel.font.pointSize), NSParagraphStyleAttributeName:paragraphStyle};
    
    self.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:title attributes:attributes];
}


@end
