//
//  BaseTextView.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "BaseTextView.h"
#import "Constant.h"

@implementation BaseTextView

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
    self.font = FontOthers_CH(self.font.pointSize);
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 4;
    
    NSDictionary *attributes = @{ NSFontAttributeName:FontOthers_CH(self.font.pointSize), NSParagraphStyleAttributeName:paragraphStyle};
    
    self.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

@end
