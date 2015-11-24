//
//  BaseTextLabel.m
//  KHhealth
//
//  Created by zcx on 14-7-17.
//  Copyright (c) 2014年 BG. All rights reserved.
//

#import "BaseLabel.h"
#import "Constant.h"

@implementation BaseLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib
{
    self.font = FontOthers_CH(self.font.pointSize);
}

- (void)setText:(NSString *)text
{
    if (text){
      
        [super setText:text];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineSpacing = 4;
        
        NSDictionary *attributes = @{ NSFontAttributeName:FontOthers_CH(self.font.pointSize), NSParagraphStyleAttributeName:paragraphStyle};
        
        self.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    

}

@end
