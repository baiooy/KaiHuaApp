//
//  ReservationHisCell.m
//  KaiHua_App

//

#define CoinViewFrame       CGRectMake(30, 33, 275, 97)


#import "ReservationHisCell.h"

@implementation ReservationHisCell

-(void)initCoinView
{
    view_doctorView = [[[NSBundle mainBundle] loadNibNamed:@"ReservationDoctorView" owner:self options:nil] objectAtIndex:0];
    view_patientView = [[[NSBundle mainBundle] loadNibNamed:@"ReservationPatientView" owner:self options:nil] objectAtIndex:0];
    
    _coinView = [_coinView initWithPrimaryView:view_doctorView
                              andSecondaryView:view_patientView
                                       inFrame:CoinViewFrame
                                   isRoundView:NO];
    self.coinView.delegate = self;
}

-(void)prepareForReuse
{
    [super prepareForReuse];
    
}

-(void)coionViewToucheEventWithObj:(UIView *)view andCoinView:(UIView *)sender
{
    [self.coinView flipTouched:nil];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.coinView = [[CMSCoinView alloc] initWithPrimaryView:nil
                                                andSecondaryView:nil
                                                         inFrame:CoinViewFrame
                                                     isRoundView:NO];
        //self.coinView.delegate = self;
        
        [self.contentView addSubview:_coinView];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    
    if (!self.coinView)
    {
        self.coinView = [[CMSCoinView alloc] initWithPrimaryView:nil
                                                andSecondaryView:nil
                                                         inFrame:CoinViewFrame
                                                     isRoundView:NO];
        //self.coinView.delegate = self;
        
        [self.contentView addSubview:_coinView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
