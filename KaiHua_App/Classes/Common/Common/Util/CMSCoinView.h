//
//  CMSCoinView.h
//  FlipViewTest
//
//  Created by Rebekah Claypool on 10/1/13.
//  Copyright (c) 2013 Coffee Bean Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CoinViewDelegate <NSObject>

-(void)coionViewToucheEventWithObj:(UIView *)view andCoinView:(UIView *)sender;

@end

@interface CMSCoinView : UIView

//如果是圆  isroundview传yes  不是则传no
- (id) initWithPrimaryView: (UIView *) view1 andSecondaryView: (UIView *) view2 inFrame: (CGRect) frame isRoundView:(BOOL)roundView;

@property (nonatomic, strong) UIView *primaryView;
@property (nonatomic, strong) UIView *secondaryView;
@property float spinTime;
@property BOOL isRoundView;

@property(nonatomic,assign)id <CoinViewDelegate> delegate;


-(IBAction) flipTouched:(id)sender;

-(IBAction)viewTouch:(id)sender;

@end
