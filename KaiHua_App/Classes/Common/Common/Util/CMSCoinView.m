//
//  CMSCoinView.m
//  FlipViewTest
//
//  Created by Rebekah Claypool on 10/1/13.
//  Copyright (c) 2013 Coffee Bean Studios. All rights reserved.
//

#import "CMSCoinView.h"


@interface CMSCoinView (){
    bool displayingPrimary;
}
@end

@implementation CMSCoinView

@synthesize primaryView=_primaryView, secondaryView=_secondaryView, spinTime;

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        displayingPrimary = YES;
        spinTime = 1.0;
        
        self.isRoundView = YES;
    }
    return self;
}

- (id) initWithPrimaryView: (UIView *) primaryView andSecondaryView: (UIView *) secondaryView inFrame: (CGRect) frame isRoundView:(BOOL)roundView{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.primaryView = primaryView;
        self.secondaryView = secondaryView;
        self.isRoundView = roundView;
        
        displayingPrimary = YES;
        spinTime = 1.0;
    }
    return self;
}

- (void) setPrimaryView:(UIView *)primaryView
{
    if (_primaryView)
    {
        [_primaryView removeFromSuperview];
        _primaryView = nil;
    }
    
    _primaryView = primaryView;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.primaryView setFrame: frame];
    [self roundView: self.primaryView];
    self.primaryView.userInteractionEnabled = YES;
    [self addSubview:self.primaryView];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTouch:)];
    gesture.numberOfTapsRequired = 1;
    [self.primaryView addGestureRecognizer:gesture];
    [self roundView:self];
    
    
//    if (_primaryView == nil)
//    {
//        _primaryView = primaryView;
//        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        [self.primaryView setFrame: frame];
//        [self roundView: self.primaryView];
//        self.primaryView.userInteractionEnabled = YES;
//        [self addSubview:self.primaryView];
//        
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTouch:)];
//        gesture.numberOfTapsRequired = 1;
//        [self.primaryView addGestureRecognizer:gesture];
//        [self roundView:self];
//    }
}

- (void) setSecondaryView:(UIView *)secondaryView
{
    if (_secondaryView)
    {
        [_secondaryView removeFromSuperview];
        _secondaryView = nil;
    }
    
    _secondaryView = secondaryView;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.secondaryView setFrame: frame];
    [self roundView: self.secondaryView];
    self.secondaryView.userInteractionEnabled = YES;
    //  [self addSubview:self.secondaryView];
    //  [self sendSubviewToBack:self.secondaryView];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTouch:)];
    gesture.numberOfTapsRequired = 1;
    [self.secondaryView addGestureRecognizer:gesture];
    [self roundView:self];
    
    
//    if (_secondaryView == nil)
//    {
//        _secondaryView = secondaryView;
//        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        [self.secondaryView setFrame: frame];
//        [self roundView: self.secondaryView];
//        self.secondaryView.userInteractionEnabled = YES;
//      //  [self addSubview:self.secondaryView];
//      //  [self sendSubviewToBack:self.secondaryView];
//        
//        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTouch:)];
//        gesture.numberOfTapsRequired = 1;
//        [self.secondaryView addGestureRecognizer:gesture];
//        [self roundView:self];
//    }
}

- (void) roundView: (UIView *) view
{
    if (self.isRoundView)
    {
        [view.layer setCornerRadius: (self.frame.size.height/2)];
        [view.layer setMasksToBounds:YES];
    }
}

-(void)removeFromSuperview
{
    [self.primaryView removeFromSuperview];
    [self.secondaryView removeFromSuperview];
    
    self.primaryView = nil;
    self.secondaryView = nil;
    
    self.delegate = nil;
    
    [super removeFromSuperview];
}

-(IBAction)viewTouch:(UITapGestureRecognizer *)sender{
    
    [_delegate coionViewToucheEventWithObj:self andCoinView:sender.view];
    
}


-(IBAction) flipTouched:(id)sender{
    
    if (!_secondaryView.superview){
        
        [self addSubview:self.secondaryView];
        [self sendSubviewToBack:self.secondaryView];
    }
    
    [UIView transitionFromView:(displayingPrimary ? self.primaryView : self.secondaryView)
                        toView:(displayingPrimary ? self.secondaryView : self.primaryView)
                      duration: spinTime
                       options: UIViewAnimationOptionTransitionFlipFromLeft+UIViewAnimationOptionCurveEaseInOut
                    completion:^(BOOL finished) {
                        if (finished) {
                            //UIView *view = (displayingPrimary ? view1 : view2);
                            
                            displayingPrimary = !displayingPrimary;
                        }
                    }
     ];
}

@end
