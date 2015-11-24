//
//  UILabel+StringHeight.m
//  KaiHua_App
//


#import "UILabel+StringHeight.h"

@implementation UILabel (StringHeight)

-(CGFloat)contentHeight
{
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, 0)
                                             options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize.height;
}

@end
