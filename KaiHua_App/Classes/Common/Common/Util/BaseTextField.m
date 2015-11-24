//
//  BaseTextField.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "BaseTextField.h"
#import "Constant.h"

@implementation BaseTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

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
