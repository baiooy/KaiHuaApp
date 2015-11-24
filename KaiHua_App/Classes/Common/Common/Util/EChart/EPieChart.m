//
//  EPieChart.m
//  EChartDemo
//
//  Created by Efergy China on 24/1/14.
//  Copyright (c) 2014年 Scott Zhu. All rights reserved.
//

#import "EPieChart.h"

#import "UICountingLabel.h"

@implementation EPieChart
@synthesize frontPie = _frontPie;
@synthesize backPie = _backPie;
@synthesize isUpsideDown = _isUpsideDown;
@synthesize delegate = _delegate;
@synthesize dataSource = _dataSource;
@synthesize ePieChartDataModel = _ePieChartDataModel;
@synthesize motionEffectOn = _motionEffectOn;

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame ePieChartDataModel:nil];
}

- (id)initWithFrame:(CGRect)frame
 ePieChartDataModel:(EPieChartDataModel *)ePieChartDataModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _isUpsideDown = NO;
        
        if (nil == ePieChartDataModel)
        {
            _frontPie = [[EPie alloc] initWithCenter: CGPointMake(CGRectGetWidth(self.bounds) / 2.0, CGRectGetHeight(self.bounds) / 2.0)
                                              radius: MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2.5 ];
        }
        else
        {
            _ePieChartDataModel = ePieChartDataModel;
            _frontPie = [[EPie alloc] initWithCenter: CGPointMake(CGRectGetWidth(self.bounds) / 2.0, CGRectGetHeight(self.bounds) / 2.0)
                                              radius: MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2.5
                                  ePieChartDataModel: _ePieChartDataModel];
        }
        
        
        _frontPie.layer.shadowOffset = CGSizeMake(0, 3);
        _frontPie.layer.shadowRadius = 5;
        _frontPie.layer.shadowColor = [UIColor clearColor].CGColor;
        _frontPie.layer.shadowOpacity = 0.8;
        _frontPie.currentColor = ePieChartDataModel.curentColor;
        
        [self addSubview:_frontPie];
        
        
        
        _backPie = [[EPie alloc] initWithCenter: CGPointMake(CGRectGetWidth(self.bounds) / 2.0, CGRectGetHeight(self.bounds) / 2.0)
                                         radius: MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) / 2.5 ];
        _backPie.layer.shadowOffset = CGSizeMake(0, 3);
        _backPie.layer.shadowRadius = 5;
        _backPie.layer.shadowColor = [UIColor clearColor].CGColor;
        _backPie.layer.shadowOpacity = 0.8;
        
        
         [_frontPie.addItemBtn addTarget:self action:@selector(addItemTypeNewValue) forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taped:)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
    }
    return self;
}

- (void) taped:(UITapGestureRecognizer *) tapGestureRecognizer
{
  //  [self turnPie];
    
}


- (void)turnPie
{
    [UIView transitionWithView:self
                      duration:0.3
                       options:_isUpsideDown?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^
     {
         if (_isUpsideDown)
         {
             if ([_delegate respondsToSelector:@selector(ePieChart:didTurnToFrontViewWithFrontView:)])
             {
                 [_delegate ePieChart:self didTurnToFrontViewWithFrontView:_frontPie];
             }
             
             [_backPie removeFromSuperview];
             [self addSubview:_frontPie];
         }
         else
         {
             if ([_delegate respondsToSelector:@selector(ePieChart:didTurnToBackViewWithBackView:)])
             {
                 [_delegate ePieChart:self didTurnToBackViewWithBackView:_backPie];
             }
             
             [_frontPie removeFromSuperview];
             [self addSubview:_backPie];
             
         }
         
     } completion:nil];
    
    _isUpsideDown = _isUpsideDown ? NO: YES;
}


-(void) addItemTypeNewValue{
    
    if ([_delegate respondsToSelector:@selector(addNewItemValueIn:)])
    {
        [_delegate addNewItemValueIn:self];
    }
    
    
}



#pragma -mark- EPieChart Setter and Getter
- (void)setDelegate:(id<EPieChartDelegate>)delegate
{
    if (delegate && delegate != _delegate)
    {
        _delegate = delegate;
    }
}

- (void)setDataSource:(id<EPieChartDataSource>)dataSource
{
    if (dataSource && dataSource != _dataSource)
    {
        _dataSource = dataSource;
        
        if ([_dataSource respondsToSelector:@selector(backViewForEPieChart:)])
        {
            _backPie.contentView = [_dataSource backViewForEPieChart:self];
        }
        
        if ([_dataSource respondsToSelector:@selector(frontViewForEPieChart:)])
        {
            _frontPie.contentView = [_dataSource frontViewForEPieChart:self];
        }
        
        
    }
}

/** motionEffect supports only iOS7 or higher, So don't turn it on if you are not using it in iOS7.*/
- (void)setMotionEffectOn:(BOOL)motionEffectOn
{
    _motionEffectOn = motionEffectOn;
    if (_motionEffectOn)
    {
        UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                                                            type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        
        verticalMotionEffect.minimumRelativeValue = @(-25);
        
        verticalMotionEffect.maximumRelativeValue = @(25);
        
        UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                              type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        
        horizontalMotionEffect.minimumRelativeValue = @(-25);
        
        horizontalMotionEffect.maximumRelativeValue = @(25);
        
        
        
        UIMotionEffectGroup *group = [UIMotionEffectGroup new];
        
        group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
        
        [self addMotionEffect:group];
    }
}


@end


@interface EPie ()

@property (nonatomic, strong) CAShapeLayer *circleBudget;
@property (nonatomic, strong) CAShapeLayer *circleCurrent;
@property (nonatomic, strong) CAShapeLayer *circleEstimate;
@property (nonatomic) CGPoint center;

@end

@implementation EPie
@synthesize ePieChartDataModel = _ePieChartDataModel;
@synthesize circleBudget = _circleBudget;
@synthesize circleCurrent = _circleCurrent;
@synthesize circleEstimate = _circleEstimate;
@synthesize center = _center;
@synthesize radius = _radius;
@synthesize budgetColor = _budgetColor;
@synthesize currentColor = _currentColor;
@synthesize estimateColor = _estimateColor;
@synthesize lineWidth = _lineWidth;
@synthesize contentView = _contentView;


- (id)initWithCenter:(CGPoint) center
              radius:(CGFloat) radius
{
    self = [super initWithFrame:CGRectMake(center.x - radius, center.y - radius, radius * 2, radius * 2)];
    if (self)
    {
        //self.clipsToBounds = YES;
        _center = center;
        _radius = radius;
        
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2.0;
        
    }
    return self;
}

- (id)initWithCenter:(CGPoint) center
              radius:(CGFloat) radius
  ePieChartDataModel:(EPieChartDataModel *)ePieChartDataModel
{
    self = [super initWithFrame:CGRectMake(center.x - radius, center.y - radius, radius * 2, radius * 2)];
    if (self)
    {
        //self.clipsToBounds = YES;
        /** Default settings*/
        _budgetColor = [UIColor whiteColor];
        _currentColor = ePieChartDataModel.curentColor;
        _estimateColor = [EYellow colorWithAlphaComponent:0.3];;
        _lineWidth = radius / 6;
        
        
        _center = center;
        _radius = radius;
        self.backgroundColor = EClearColor;
        self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2.0;
        _ePieChartDataModel = ePieChartDataModel;
        
        /** Default Content View*/
        _contentView = [[UIView alloc] initWithFrame:self.bounds];
        _contentView.clipsToBounds = YES;
        
        UICountingLabel *budgetLabel = [[UICountingLabel alloc] initWithFrame:self.frame];
        budgetLabel.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) * 0.7);
        budgetLabel.textAlignment = NSTextAlignmentCenter;
        budgetLabel.method = UILabelCountingMethodEaseInOut;
        budgetLabel.font = FontOthers_Number(52);
        budgetLabel.textColor = _currentColor;
        budgetLabel.format = @"%.0f";
        [_contentView addSubview:budgetLabel];
        [budgetLabel countFrom:0 to:_ePieChartDataModel.current withDuration:2.0f];
        
        /* 单位 类型*/
        UILabel *label_Unit = [[UILabel alloc]initWithFrame:self.frame];
        label_Unit.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) * 1.2);
        label_Unit.textAlignment = NSTextAlignmentCenter;
        [label_Unit setTextColor:_currentColor];
        [label_Unit setText:ePieChartDataModel.itemUnit];
        [label_Unit setFont:FontOthers_CH(15)];
        
        UILabel *label_Type = [[UILabel alloc]initWithFrame:self.frame];
        label_Type.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) * 1.5);
        label_Type.textAlignment = NSTextAlignmentCenter;
        [label_Type setTextColor:EFontColor];
        [label_Type setText:ePieChartDataModel.itemType];
        [label_Type setFont:FontOthers_CH(15)];
        [_contentView addSubview:label_Unit];
        [_contentView addSubview:label_Type];
        
        /* 增加起始位置值*/
        UICountingLabel *startLabel = [[UICountingLabel alloc] initWithFrame:self.frame];
        startLabel.center = CGPointMake(CGRectGetMidX(self.bounds) - self.bounds.size.width / 4, self.bounds.size.height - 10);
        startLabel.textAlignment = NSTextAlignmentCenter;
        startLabel.method = UILabelCountingMethodEaseInOut;
        startLabel.font = FontOthers_Number(12);
        startLabel.textColor = _currentColor;
        [_contentView addSubview:startLabel];
        startLabel.format = @"%.0f";
        [startLabel countFrom:0 to:_ePieChartDataModel.estimate withDuration:2.0f];
        
        UICountingLabel *endLabel = [[UICountingLabel alloc] initWithFrame:self.frame];
        endLabel.center = CGPointMake(CGRectGetMidX(self.bounds) + self.bounds.size.width / 4, self.bounds.size.height - 10);
        endLabel.textAlignment = NSTextAlignmentCenter;
        endLabel.method = UILabelCountingMethodEaseInOut;
        endLabel.font = FontOthers_Number(12);
        endLabel.textColor = _currentColor;
        endLabel.format = @"%.0f";
        [_contentView addSubview:endLabel];
        [endLabel countFrom:0 to:_ePieChartDataModel.budget withDuration:2.0f];
        
        
        /* 添加编辑按钮*/
        _addItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addItemBtn setImage:[UIImage imageNamed:@"btn_MR_Edit"] forState:UIControlStateNormal];
        [_addItemBtn setFrame:CGRectMake(0, 0, 40, 25)];
         _addItemBtn.center = CGPointMake(CGRectGetMidX(self.bounds), self.bounds.size.height - 10);
       
         [_contentView addSubview:_addItemBtn];
        
        [self reloadContent];
        
    }
    return self;
}



#pragma -mark- Setter and Getter
- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    [self reloadContent];
}

- (void)setRadius:(CGFloat)radius
{
    _radius = radius;
    [self reloadContent];
}

- (void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    [self reloadContent];
}

-(void)setBudgetColor:(UIColor *)budgetColor
{
    _budgetColor = budgetColor;
    [self reloadContent];
}

- (void)setEstimateColor:(UIColor *)estimateColor
{
    _estimateColor = estimateColor;
    [self reloadContent];
}

- (void)setContentView:(UIView *)contentView
{
    if (contentView)
    {
        [_contentView removeFromSuperview];
        _contentView = contentView;
        [self addSubview:_contentView];
        
        NSLog(@"_contentView %@", NSStringFromCGRect(_contentView.frame));
        NSLog(@"self %@", NSStringFromCGRect(self.frame));
    }
}




- (void) reloadContent
{
    UIBezierPath* circleBudgetPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
                                                                    radius: _radius * 0.8
                                                                startAngle: M_PI * 3 /4
                                                                  endAngle: M_PI * 9 /4
                                                                 clockwise:YES];
    if (!_circleBudget)
        _circleBudget = [CAShapeLayer layer];
    _circleBudget.path = circleBudgetPath.CGPath;
    _circleBudget.fillColor = [UIColor clearColor].CGColor;
    _circleBudget.strokeColor = _budgetColor.CGColor;
    _circleBudget.lineCap = kCALineCapRound;
    _circleBudget.lineWidth = _lineWidth / 3;
    _circleBudget.zPosition = -1;
    
    UIBezierPath* circleCurrentPath = [UIBezierPath bezierPathWithArcCenter: CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
                                                                     radius: _radius * 0.8
                                                                 startAngle: M_PI * 3 /4
                                                                   endAngle: (M_PI * 9 /4) / _ePieChartDataModel.budget *_ePieChartDataModel.current
                                                                  clockwise: YES];
    if (!_circleCurrent)
        _circleCurrent = [CAShapeLayer layer];
    _circleCurrent.path = circleCurrentPath.CGPath;
    _circleCurrent.fillColor = [UIColor clearColor].CGColor;
    _circleCurrent.strokeColor = _currentColor.CGColor;
    _circleCurrent.lineCap = kCALineCapRound;
    _circleCurrent.lineWidth = _lineWidth;
    _circleCurrent.zPosition = 1;
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    // [_circleBudget addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    [_circleCurrent addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    
    [self.layer addSublayer:_circleBudget];
    [self.layer addSublayer:_circleCurrent];
    
    if (_contentView)
    {
        [self addSubview:_contentView];
    }
    
}

- (void) reloadContentWithEPieChartDataModel:(EPieChartDataModel *)ePieChartDataModel
{
    _ePieChartDataModel = ePieChartDataModel;
    [self reloadContent];
}

@end


@implementation EPieChartDataModel
@synthesize current = _current;
@synthesize budget = _budget;
@synthesize estimate = _estimate;
@synthesize itemType = _itemType;
@synthesize itemUnit = _itemUnit;
@synthesize curentColor = _curentColor;


- (id)init
{
    self = [super init];
    if (self)
    {
        _budget = 100;
        _current = 40;
        _estimate = 80;
        _itemType = @"";
        _itemUnit = @"";
    }
    return self;
}

- (id)initWithBudget:(CGFloat)budget current:(CGFloat)current estimate:(CGFloat)estimate itemUnit:(NSString *)Unit itemType:(NSString *)Type itemColor:(UIColor *)color

{
    self = [self init];
    if (self)
    {
        _budget = budget;
        _current = current;
        _estimate = estimate;
        _itemType = Type;
        _itemUnit = Unit;
        _curentColor =color;
    }
    return self;
}



@end
