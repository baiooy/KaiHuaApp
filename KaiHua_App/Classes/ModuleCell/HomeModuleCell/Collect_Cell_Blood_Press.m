//
//  Collect_Cell_Blood_Press.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "Collect_Cell_Blood_Press.h"
#import "SHLineGraphView.h"
#import "SHPlot.h"


@implementation Collect_Cell_Blood_Press



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
  
   
    return self;
}


-(void) setBloodPressLayout{
    
    
   

    

    UIView *view = [self.viewForBaselineLayout viewWithTag:10];
    
    EPieChartDataModel *ePieChartDataModel = [[EPieChartDataModel alloc] initWithBudget:200 current:150 estimate:0 itemUnit:@"mmHg" itemType:@"高血压值" itemColor:E_Blood_Press_Heigth_Color];
    
    if (!_ePieChart)
    {
        //EPieChart *ePieChart = [[EPieChart alloc] initWithFrame:CGRectMake(100, 150, 150, 150)];
        _ePieChart = [[EPieChart alloc] initWithFrame:view.frame
                                   ePieChartDataModel:ePieChartDataModel];
    }
    
    _ePieChart.center = view.center;
    [_ePieChart.frontPie setLineWidth:13];
    [_ePieChart.frontPie setRadius:85];
    _ePieChart.frontPie.currentColor = E_Blood_Press_Heigth_Color;
    _ePieChart.frontPie.budgetColor =  EChatBaseColor;
    //    ePieChart.frontPie.estimateColor = [UIColor blueColor];
    [_ePieChart setDelegate:self];
    [_ePieChart setDataSource:self];
    [_ePieChart setMotionEffectOn:NO];
    
    [self.viewForBaselineLayout addSubview:_ePieChart];
    
    
    /* 绘制低血 图形*/
    UIView *view_Lown = [self.viewForBaselineLayout viewWithTag:20];
    
    EPieChartDataModel *PieChartDataModel_Lown = [[EPieChartDataModel alloc] initWithBudget:112 current:80 estimate:0 itemUnit:@"mmHg" itemType:@"低血压值" itemColor:E_Blood_Press_Low_Color];
    
    if (!_ePieChartLown)
    {
        //EPieChart *ePieChart = [[EPieChart alloc] initWithFrame:CGRectMake(100, 150, 150, 150)];
        _ePieChartLown = [[EPieChart alloc] initWithFrame:view_Lown.frame
                                   ePieChartDataModel:PieChartDataModel_Lown];
    }
    
    _ePieChartLown.center = view_Lown.center;
    
    [_ePieChartLown.frontPie setLineWidth:13];
    [_ePieChartLown.frontPie setRadius:85];
    _ePieChartLown.frontPie.currentColor = E_Blood_Press_Low_Color;
    _ePieChartLown.frontPie.budgetColor =  EChatBaseColor;
    //    ePieChart.frontPie.estimateColor = [UIColor blueColor];
    [_ePieChartLown setDelegate:self];
    [_ePieChartLown setDataSource:self];
    [_ePieChartLown setMotionEffectOn:NO];
    
    [self.viewForBaselineLayout addSubview:_ePieChartLown];
    
    /* 绘制K 线 图形*/
    UIView *view_ChartView = [self.viewForBaselineLayout viewWithTag:30];
    
    // Chart View
    CGRect frame = view_ChartView.frame;
    frame.origin.y = view_ChartView.frame.origin.y + 40;
    frame.size.height = view_ChartView.frame.size.height - 40;
    
    SHLineGraphView *_lineGraph = [[SHLineGraphView alloc] initWithFrame:frame];
    
    NSDictionary *_themeAttributes = @{
                                       kXAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kXAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.4],
                                       kYAxisLabelFontKey : [UIFont fontWithName:@"TrebuchetMS" size:10],
                                       kYAxisLabelSideMarginsKey : @20,
                                       kPlotBackgroundLineColorKey : [UIColor colorWithRed:0.48 green:0.48 blue:0.49 alpha:0.1],
                                       kDotSizeKey : @10
                                       };
    _lineGraph.themeAttributes =  _themeAttributes;
    
    [self loadCharView:_lineGraph WithData:nil];
    
    [self.viewForBaselineLayout addSubview:_lineGraph];
}


-(void)loadCharView:(SHLineGraphView *)charView WithData:(id *)data{
    
    if (charView){
        
        charView.yAxisRange = @(98);
        charView.yAxisSuffix = @"";
        // x轴显示
        charView.xAxisValues = @[
                                 @{ @1 : @"JAN" },
                                 @{ @2 : @"FEB" },
                                 @{ @3 : @"MAR" },
                                 @{ @4 : @"APR" },
                                 @{ @5 : @"MAY" },
                                 @{ @6 : @"JUN" },
                                 @{ @7 : @"JUL" },
                                 @{ @8 : @"AUG" },
                                 @{ @9 : @"SEP" },
                                 @{ @10 : @"OCT" },
                                 @{ @11 : @"NOV" },
                                 @{ @12 : @"DEC" }
                                 ];
        
        // 数据点
        SHPlot *_plot1 = [[SHPlot alloc] init];
        
        _plot1.plottingValues = @[
                                  @{ @1 : @70 },
                                  @{ @2 : @20 },
                                  @{ @3 : @90 },
                                  @{ @4 : @22 },
                                  @{ @5 : @88 },
                                  @{ @6 : @45.8 },
                                  @{ @7 : @77 },
                                  @{ @8 : @97 },
                                  @{ @9 : @45 },
                                  @{ @10 : @10 },
                                  @{ @11 : @32 },
                                  @{ @12 : @23 }
                                  ];
        
        NSArray *arr = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
        _plot1.plottingPointsLabels = arr;
        
        // 数据点
        SHPlot *_plot2 = [[SHPlot alloc] init];
        
        _plot2.plottingValues = @[
                                  @{ @1 : @65.8 },
                                  @{ @2 : @20 },
                                  @{ @3 : @23 },
                                  @{ @4 : @22 },
                                  @{ @5 : @12.3 },
                                  @{ @6 : @45.8 },
                                  @{ @7 : @56 },
                                  @{ @8 : @97 },
                                  @{ @9 : @65 },
                                  @{ @10 : @10 },
                                  @{ @11 : @67 },
                                  @{ @12 : @23 }
                                  ];
        
        
        _plot2.plottingPointsLabels = arr;
        
        // 数据点 格式配置
        NSDictionary *_plotThemeAttributes = @{
                                               kPlotFillColorKey : [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5],
                                               kPlotStrokeWidthKey : @2,
                                               kPlotStrokeColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                               kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                               kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                               };
        
        _plot1.plotThemeAttributes = _plotThemeAttributes;
        _plot2.plotThemeAttributes = _plotThemeAttributes;
        
        
        [charView addPlot:_plot1];
        [charView addPlot:_plot2];
        [charView setupTheView];
        
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
