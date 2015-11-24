//
//  HealthModuleCell.m
//  KaiHua_App
//

#import "HealthModuleCell.h"

@implementation HealthModuleCell

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

-(void)setCellData:(NSDictionary *)dict{
 
    UIImage *imgBanner = [UIImage imageNamed:[dict objectForKey:@"typeImgBig"]];
    [_imv_articleTypeImageView setImage:imgBanner];
    
}

@end
