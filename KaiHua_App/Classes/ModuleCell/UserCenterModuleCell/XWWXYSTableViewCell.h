//
//  XWWXYSTableViewCell.h
//  KaiHua_App


#import <UIKit/UIKit.h>

@interface XWWXYSTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UITextField *input_Question_Yes_Remark;

@property (weak, nonatomic) IBOutlet UITextField *input_Question_Yes_Times;

@property (weak, nonatomic) IBOutlet UITextField *input_Question_Yes_HowMuch;


@property (weak, nonatomic) IBOutlet UIButton *btn_Yes;

@property (weak, nonatomic) IBOutlet UIButton *btn_No;

@property (strong, nonatomic) NSMutableArray *btnList;


@property (weak, nonatomic) IBOutlet UIButton *btn_Commite;



@end
