//
//  HealthArticleCell.m
//  KaiHua_App
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "HealthArticleCell.h"
#import "UILabel+StringHeight.h"

//cell 默认的宽度就是145
#define CellDefaultWidth        145

//照片的默认宽高
#define CellImageViewWidth      145
#define CellImageViewHeight     88

//标签的左右间距
#define LableMarginLeft         7
#define LableMarginRight        10
#define LableMarginVercital     7

//标签的默认高度和最大高度
#define LableDefaultHeight      18
#define LableTitleMaxHeight     34
#define LableContentMaxHeight   30

@interface HealthArticleCell()

//文章图片  显示在上方  尺寸应为固定值 145 * 88
@property (nonatomic , strong) UIImageView *imv_articleImage;

//文章标题  默认最多显示两行 超过两行显示省略号
@property (nonatomic , strong) UILabel *lbl_titleLable;

//违章内容  默认显示两行 超过两行显示省略号
@property (nonatomic , strong) UILabel *lbl_contentLable;

@end

@implementation HealthArticleCell


-(CGFloat)layoutSubviewsWithHealthArticle:(HealthArticle *)healthArticle
{
    self.healthArticle = healthArticle;
    
    self.imv_articleImage.image = [UIImage imageNamed:healthArticle.pictureId];
    self.lbl_titleLable.text = healthArticle.title;
    self.lbl_contentLable.text = healthArticle.content;
    
    CGFloat titleLableHeight = [self.lbl_titleLable contentHeight];
    
    if (titleLableHeight > LableTitleMaxHeight)
    {
        titleLableHeight = LableTitleMaxHeight;
    }
    
    CGRect frame = self.lbl_titleLable.frame;
    frame.size.height = titleLableHeight;
    self.lbl_titleLable.frame = frame;
    
    CGFloat contentLableHeight = [self.lbl_contentLable contentHeight];
    
    if (contentLableHeight > LableContentMaxHeight)
    {
        contentLableHeight = LableContentMaxHeight;
    }
    
    self.lbl_contentLable.frame = CGRectMake(LableMarginLeft,
                                             CellImageViewHeight + LableMarginVercital*2 + self.lbl_titleLable.frame.size.height,
                                             CellDefaultWidth-LableMarginLeft-LableMarginRight,
                                             contentLableHeight);
    
    return self.lbl_contentLable.frame.origin.y + self.lbl_contentLable.frame.size.height + LableMarginVercital;
}


-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.imv_articleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CellImageViewWidth, CellImageViewHeight)];
        [self addSubview:self.imv_articleImage];
        
        self.lbl_titleLable = [[UILabel alloc] initWithFrame:CGRectMake(LableMarginLeft,
                                                                        CellImageViewHeight+LableMarginVercital,
                                                                        CellDefaultWidth-LableMarginLeft-LableMarginRight,
                                                                        LableDefaultHeight)];
        self.lbl_titleLable.font = FontOthers_CH(14);
        self.lbl_titleLable.numberOfLines = 2;
        self.lbl_titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
        self.lbl_titleLable.textColor = [UIColor colorWithRed:64/255. green:64/255. blue:64/255. alpha:1];
        [self addSubview:self.lbl_titleLable];
        
        self.lbl_contentLable = [[UILabel alloc] initWithFrame:CGRectMake(LableMarginLeft,
                                                                        CellImageViewHeight+LableMarginVercital*2+LableDefaultHeight,
                                                                        CellDefaultWidth-LableMarginLeft-LableMarginRight,
                                                                        LableDefaultHeight)];
        self.lbl_contentLable.font = FontOthers_CH(11);
        self.lbl_contentLable.numberOfLines = 2;
        self.lbl_contentLable.lineBreakMode = NSLineBreakByTruncatingTail;
        self.lbl_contentLable.textColor = [UIColor colorWithRed:107/255. green:107/255. blue:107/255. alpha:1];
        [self addSubview:self.lbl_contentLable];
    }
    
    return self;
}

//-(void)layoutSubviews
//{
//    
//}

-(void)dealloc
{
    [self.imv_articleImage removeFromSuperview];
    [self.lbl_contentLable removeFromSuperview];
    [self.lbl_titleLable removeFromSuperview];
    
    self.imv_articleImage = nil;
    self.lbl_contentLable = nil;
    self.lbl_titleLable = nil;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
