//
//  Collect_Cell_Blood_Gluess.m
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import "Collect_Cell_Blood_Gluess.h"
#import "SHLineGraphView.h"
#import "SHPlot.h"


@implementation Collect_Cell_Blood_Gluess

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


-(void) setBloodGluessLayout{
    
    
    UIView *view = [self.viewForBaselineLayout viewWithTag:10];
    
    EPieChartDataModel *ePieChartDataModel = [[EPieChartDataModel alloc] initWithBudget:20 current:10 estimate:0 itemUnit:@"mmvol/L" itemType:@"血糖值(空腹)" itemColor:E_Blood_Gluess_Color];
    
    if (!_ePieChart)
    {
        //EPieChart *ePieChart = [[EPieChart alloc] initWithFrame:CGRectMake(100, 150, 150, 150)];
        _ePieChart = [[EPieChart alloc] initWithFrame:view.frame
                                   ePieChartDataModel:ePieChartDataModel];
    }
    
    _ePieChart.center = view.center;
    [_ePieChart.frontPie setLineWidth:15];
    [_ePieChart.frontPie setRadius:100];
    _ePieChart.frontPie.currentColor = E_Blood_Gluess_Color;
    _ePieChart.frontPie.budgetColor = EChatBaseColor;
    //    ePieChart.frontPie.estimateColor = [UIColor blueColor];
    [_ePieChart setDelegate:self];
    [_ePieChart setDataSource:self];
    [_ePieChart setMotionEffectOn:NO];
    
    [self.viewForBaselineLayout addSubview:_ePieChart];
    
    
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

    /*加载线形图*/

    
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
        
        NSArray *arr = @[@"1", @"2", @"3", @"4", @"5", @"6" , @"7" , @"8", @"9", @"10", @"11", @"12"];
        _plot1.plottingPointsLabels = arr;
        
        // 数据点 格式配置
        NSDictionary *_plotThemeAttributes = @{
                                               kPlotFillColorKey : [UIColor colorWithRed:0.47 green:0.75 blue:0.78 alpha:0.5],
                                               kPlotStrokeWidthKey : @2,
                                               kPlotStrokeColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                               kPlotPointFillColorKey : [UIColor colorWithRed:0.18 green:0.36 blue:0.41 alpha:1],
                                               kPlotPointValueFontKey : [UIFont fontWithName:@"TrebuchetMS" size:18]
                                               };
        
        _plot1.plotThemeAttributes = _plotThemeAttributes;
        
         [charView addPlot:_plot1];
         [charView setupTheView];
        
    }
    
}




@end
