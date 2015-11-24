//
//  Collect_Cell_Head_Rate.h
//  KaiHua_App
//
//  Copyright (c) 2014年 rock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPieChart.h"


@interface Collect_Cell_Head_Rate : UICollectionViewCell<EPieChartDataSource,EPieChartDelegate>


@property (strong, nonatomic) EPieChart *ePieChart;
@property (strong, nonatomic) EPieChart *ePieChartLown;

/* 设置视图*/
-(void) setHeatRateLayout;


@end
