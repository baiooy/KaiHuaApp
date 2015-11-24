//
//  DropDownListView.m
//  DropDownDemo
//
//  Created by 童明城 on 14-5-28.
//  Copyright (c) 2014年 童明城. All rights reserved.
//

#import "DropDownListView.h"
#import "Constant.h"
#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 *M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians)*(180.0/M_PI))
#define DROPDOWN_LIST_HEIGTH 300


@implementation DropDownListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame dataSource:(id)datasource delegate:(id) delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        currentExtendSection = -1;
        self.dropDownDataSource = datasource;
        self.dropDownDelegate = delegate;
        
        // 底部添加 分割线
        UILabel *labelLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 1)];
        [labelLine setBackgroundColor:[UIColor colorWithRed:191.0/255 green:191.0/255 blue:191.0/255 alpha:1]];
        [labelLine setCenter:CGPointMake(Screen_width/2, frame.size.height - labelLine.frame.size.height / 2)];
        [self addSubview:labelLine];
        
        NSInteger sectionNum =0;
        if ([self.dropDownDataSource respondsToSelector:@selector(numberOfSections)] ) {
            
            sectionNum = [self.dropDownDataSource numberOfSections];
        }
        
        if (sectionNum == 0) {
            self = nil;
        }
        
        //初始化默认显示view
        CGFloat sectionWidth = (1.0*(frame.size.width)/sectionNum);
        for (int i = 0; i <sectionNum; i++) {
            UIButton *sectionBtn = [[UIButton alloc] initWithFrame:CGRectMake(sectionWidth*i, 1, sectionWidth, frame.size.height-2)];
            sectionBtn.tag = SECTION_BTN_TAG_BEGIN + i;
            [sectionBtn addTarget:self action:@selector(sectionBtnTouch:) forControlEvents:UIControlEventTouchUpInside];
            NSString *sectionBtnTitle = @"--";
            if ([self.dropDownDataSource respondsToSelector:@selector(titleInSection:index:)]) {
                sectionBtnTitle = [self.dropDownDataSource titleInSection:i index:[self.dropDownDataSource defaultShowSection:i]];
            }
            [sectionBtn setTitle:sectionBtnTitle forState:UIControlStateNormal];
            [sectionBtn setTitleColor:[UIColor colorWithRed:78.0/255 green:78.0/255 blue:78.0/255 alpha:1] forState:UIControlStateNormal];
            sectionBtn.titleLabel.font = FontOthers_CH(13);
            [self addSubview:sectionBtn];
            
            UIImageView *sectionBtnIv = [[UIImageView alloc] initWithFrame:CGRectMake(sectionWidth*i +(sectionWidth - 16), (self.frame.size.height-5)/2, 10, 5)];
            [sectionBtnIv setImage:[UIImage imageNamed:@"btn_Doctor_Search_Arrow"]];
            [sectionBtnIv setContentMode:UIViewContentModeScaleToFill];
            sectionBtnIv.tag = SECTION_IV_TAG_BEGIN + i;
            
            [self addSubview: sectionBtnIv];
            
            if (i<sectionNum && i != 0) {
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(sectionWidth*i, 0, 1, frame.size.height)];
                lineView.backgroundColor = [UIColor colorWithRed:204.0/255 green:204.0/255 blue:204.0/255 alpha:1];
                [self addSubview:lineView];
            }
            
        }
        
    }
    return self;
}

-(void)sectionBtnTouch:(UIButton *)btn
{
    NSInteger section = btn.tag - SECTION_BTN_TAG_BEGIN;
    
    UIImageView *currentIV= (UIImageView *)[self viewWithTag:(SECTION_IV_TAG_BEGIN +currentExtendSection)];
    
    [UIView animateWithDuration:0.3 animations:^{
        currentIV.transform = CGAffineTransformRotate(currentIV.transform, DEGREES_TO_RADIANS(180));
    }];
    
    if (currentExtendSection == section) {
        [self hideExtendedChooseView];
    }else{
        currentExtendSection = section;
        currentIV = (UIImageView *)[self viewWithTag:SECTION_IV_TAG_BEGIN + currentExtendSection];
        [UIView animateWithDuration:0.3 animations:^{
            currentIV.transform = CGAffineTransformRotate(currentIV.transform, DEGREES_TO_RADIANS(180));
        }];
        
        [self showChooseListViewInSection:currentExtendSection choosedIndex:[self.dropDownDataSource defaultShowSection:currentExtendSection]];
    }

}

- (void)setTitle:(NSString *)title inSection:(NSInteger) section
{
    UIButton *btn = (id)[self viewWithTag:SECTION_BTN_TAG_BEGIN +section];
    [btn setTitle:title forState:UIControlStateNormal];
}

- (BOOL)isShow
{
    if (currentExtendSection == -1) {
        return NO;
    }
    return YES;
}
-  (void)hideExtendedChooseView
{
    if (currentExtendSection != -1) {
        currentExtendSection = -1;
        CGRect rect = self.mTableView.frame;
        rect.size.height = 0;
        [UIView animateWithDuration:0.3 animations:^{
            self.mTableBaseView.alpha = 1.0f;
            self.mTableView.alpha = 1.0f;
            
            self.mTableBaseView.alpha = 0.1f;
            self.mTableView.alpha = 0.2;
            
            self.mTableView.frame = rect;
        }completion:^(BOOL finished) {
            [self.mTableView removeFromSuperview];
            [self.mTableBaseView removeFromSuperview];
        }];
    }
}

-(void)showChooseListViewInSection:(NSInteger)section choosedIndex:(NSInteger)index
{
    if (!self.mTableView) {
        self.mTableBaseView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height , self.frame.size.width, self.mSuperView.frame.size.height - self.frame.origin.y - self.frame.size.height)];
        self.mTableBaseView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.1];
        
        UITapGestureRecognizer *bgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgTappedAction:)];
        [self.mTableBaseView addGestureRecognizer:bgTap];
        
        self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x , self.frame.origin.y + self.frame.size.height, self.frame.size.width, DROPDOWN_LIST_HEIGTH) style:UITableViewStylePlain];
        [self.mTableView setSeparatorColor:[UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1]];
        [self.mTableView setBackgroundColor:[UIColor whiteColor]];
        self.mTableView.delegate = self;
        self.mTableView.dataSource = self;
        
    }
    
    /*
    //修改tableview的frame
    int sectionWidth = (self.frame.size.width)/[self.dropDownDataSource numberOfSections];
    CGRect rect = self.mTableView.frame;
    rect.origin.x = sectionWidth *section;
    rect.size.width = sectionWidth;
    rect.size.height = 0;
    */
    // 下拉菜单全屏显示
    CGRect rect = self.mTableView.frame;
    rect.size.height = 0;
    
    self.mTableView.frame = rect;
    [self.mSuperView addSubview:self.mTableBaseView];
    [self.mSuperView addSubview:self.mTableView];
    
    //动画设置位置
    rect .size.height = DROPDOWN_LIST_HEIGTH;
    [UIView animateWithDuration:0.3 animations:^{
        self.mTableBaseView.alpha = 0.1;
        self.mTableView.alpha = 0.2;
        
        self.mTableBaseView.alpha = 1.0;
        self.mTableView.alpha = 1.0;
        self.mTableView.frame =  rect;
    }];
    [self.mTableView reloadData];
}

-(void)bgTappedAction:(UITapGestureRecognizer *)tap
{
    UIImageView *currentIV = (UIImageView *)[self viewWithTag:(SECTION_IV_TAG_BEGIN + currentExtendSection)];
    [UIView animateWithDuration:0.3 animations:^{
        currentIV.transform = CGAffineTransformRotate(currentIV.transform, DEGREES_TO_RADIANS(180));
    }];
    [self hideExtendedChooseView];
}
#pragma mark -- UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 41;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dropDownDelegate respondsToSelector:@selector(chooseAtSection:index:)]) {
        NSString *chooseCellTitle = [self.dropDownDataSource titleInSection:currentExtendSection index:indexPath.row];
        
        UIButton *currentSectionBtn = (UIButton *)[self viewWithTag:SECTION_BTN_TAG_BEGIN + currentExtendSection];
        [currentSectionBtn setTitle:chooseCellTitle forState:UIControlStateNormal];
        
        [self.dropDownDelegate chooseAtSection:currentExtendSection index:indexPath.row];
        [self hideExtendedChooseView];
    }
}

#pragma mark -- UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dropDownDataSource numberOfRowsInSection:currentExtendSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [self.dropDownDataSource titleInSection:currentExtendSection index:indexPath.row];
    cell.textLabel.font = FontOthers_CH(13);
    cell.textLabel.textColor = [UIColor colorWithRed:78.0/255 green:78.0/255 blue:78.0/255 alpha:1];
    [cell.textLabel setCenter:CGPointMake(Screen_width / 2 + 20, cell.textLabel.center.y)];
    return cell;
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
