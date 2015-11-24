//
//  HealthArticleViewController.m
//  KaiHua_App
//

//

#import "HealthArticleViewController.h"

//时间 、 来源 和 文章内容  字体颜色
#define TextColor [[UIColor blackColor]colorWithAlphaComponent:0.6]

@interface HealthArticleViewController ()<NSLayoutManagerDelegate>

/* 背景滚动视图*/
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview_Bg;

/* 文章内容相关*/
@property (weak, nonatomic) IBOutlet UIImageView *img_Article_Img;

@property (weak, nonatomic) IBOutlet UILabel *label_Article_Title;

@property (weak, nonatomic) IBOutlet UILabel *label_Article_Time;

@property (weak, nonatomic) IBOutlet UILabel *label_Article_From;

@property (weak, nonatomic) IBOutlet UITextView *textView_Content;


/* 底部导航视图*/
@property (weak, nonatomic) IBOutlet UIView *view_Navigation_BG;

@property (weak, nonatomic) IBOutlet UIButton *btn_Back;

@property (weak, nonatomic) IBOutlet UIButton *btn_Priview;

@property (weak, nonatomic) IBOutlet UIButton *btn_Next;


/* 喜欢按钮*/
@property (weak, nonatomic) IBOutlet UIButton *btn_Favourite;


@end

@implementation HealthArticleViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //在进入视图时隐藏系统状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
  NSLog(@"健康服务");
    //在退出视图时显示系统状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setViewTitle:@"健康服务"];
   // [self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    // 自定义右边键
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];

    
    _articleIndex = 1;
    
    [self setViewControlsValueWith:_articleList WithIndex:_articleIndex];
    
    //设置标题 时间 来源 的字体
    _label_Article_Title.font = FontOthers_CH(17);
    _label_Article_Time.font = FontOthers_CH(11);
    _label_Article_From.font = FontOthers_CH(11);
    //_label_Article_Title.textColor = TextColor;
    _label_Article_Time.textColor = TextColor;
    _label_Article_From.textColor = TextColor;
    
    
    //设置底部文章导航栏在屏幕下方  点击时再出现
    _view_Navigation_BG.frame = CGRectMake(0,Screen_height, Screen_width, 50);
    
    //添加手势 弹出/隐藏底部文章导航栏
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundView)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [_scrollview_Bg addGestureRecognizer:tap];
    
    
    //设置行间距
    //_textView_Content.delegate = self;
    //_textView_Content.layoutManager.delegate = self;
    
}

/* 赋值*/
-(void)setViewControlsValueWith:(NSArray *)list WithIndex:(int)index{
    
    NSDictionary *info = [_articleList objectAtIndex:index];
    
    UIImage *art_Img = [UIImage imageNamed:[info objectForKey:@"img"]];
    [_img_Article_Img setImage:art_Img];
    [_label_Article_Title setText:[info objectForKey:@"title"]];
    [_label_Article_Time setText:[info objectForKey:@"createTime"]];
    [_label_Article_From setText:[info objectForKey:@"from"]];

    //[_textView_Content setText:[info objectForKey:@"content"]];
    
    [_textView_Content setFont:FontOthers_CH(11)];
    [_textView_Content setTextColor:TextColor];
    
    
    //设置行间距
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing  = 10;
    NSDictionary *attr = @{NSFontAttributeName:FontOthers_CH(11),NSParagraphStyleAttributeName:style};
    _textView_Content.attributedText = [[NSAttributedString alloc] initWithString:[info objectForKey:@"content"] attributes:attr];
    //设置行间距结束
    
    /* 动态计算 ScrollView ContentSize */
    CGFloat textViewH = [self getControlHWithTextView:_textView_Content attributes:attr];
    
    CGRect textView = _textView_Content.frame;
    textView.size.height = textViewH+5;//如果text view的高度和content size 高度一样  会出现轻微滚动   所以frame高度要大于content高度
    [_textView_Content setFrame:textView];
    _textView_Content.contentSize = CGSizeMake(_textView_Content.frame.size.width, textViewH);
    
    [_scrollview_Bg setContentSize:CGSizeMake(Screen_width, _img_Article_Img.frame.size.height + 70 + textViewH + 20)];//70是标题和时间标签高度 20是底部留白
}


#pragma mark-- 喜欢按钮
- (IBAction)btnFavouritEvent:(id)sender
{
    
}

#pragma mark-- 底部导航视图按钮
/* 返回*/
- (IBAction)btnBackeEvent:(id)sender {
   
    [self.navigationController popViewControllerAnimated:YES];
}

/* 下一个*/
- (IBAction)btn_PriviewEvent:(id)sender
{
    //需要考虑文章数量范围 防止数组越界
    
//  _articleIndex ++;
//  [self setViewControlsValueWith:_articleList WithIndex:_articleIndex];
}

/* 上一个*/
- (IBAction)btn_NextEvent:(id)sender
{
    //需要考虑文章数量范围 防止数组越界
    
//  _articleIndex --;
//  [self setViewControlsValueWith:_articleList WithIndex:_articleIndex];
}



#pragma mark - 底部导航栏显示有关

- (void) tapBackgroundView
{
    if ([self isBottomNavigationBarShowing])
    {
        [self hideBottomNavigationBar];
    }
    else
    {
        [self presentBottomNavigationBar];
    }
}

//判断底部的导航栏是否在显示
- (BOOL) isBottomNavigationBarShowing
{
    if (_view_Navigation_BG.center.y < Screen_height) {
        return YES;
    }
    
    return NO;
}

//弹出底部的文章导航栏
- (void) presentBottomNavigationBar
{
    [UIView animateKeyframesWithDuration:0.25
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionAllowUserInteraction
                              animations:^{
                                  
                                  CGRect frame = _view_Navigation_BG.frame;
                                  frame.origin.y = Screen_height-frame.size.height;
                                  _view_Navigation_BG.frame = frame;
                                  
                              }
                              completion:^(BOOL finished) {
                                  
                              }];
}


//隐藏底部的文章导航栏
- (void) hideBottomNavigationBar
{
    [UIView animateKeyframesWithDuration:0.25
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionAllowUserInteraction
                              animations:^{
                                  
                                  CGRect frame = _view_Navigation_BG.frame;
                                  frame.origin.y = Screen_height;
                                  _view_Navigation_BG.frame = frame;
                                  
                              }
                              completion:^(BOOL finished) {
                                  
                              }];
}


//text view 行间距
//-(CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
//{
//    return 10;
//}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
