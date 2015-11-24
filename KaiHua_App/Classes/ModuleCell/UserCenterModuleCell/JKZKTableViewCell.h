//
//  JKZKTableViewCell.h
//  KaiHua_App
//

//

#import <UIKit/UIKit.h>

@class JKZKTableViewCell;

@protocol JKZKTableViewCellDelegate <NSObject>

- (void) textChanged:(NSString *)text cell:(JKZKTableViewCell *)cell;

@end



@interface JKZKTableViewCell : UITableViewCell<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label_Question_title;

//@property (weak, nonatomic) IBOutlet UILabel *label_Question_Yes_Remark;


//供输入的文本框  只有在选择“是”的按钮时才能输入
@property (weak, nonatomic) IBOutlet UITextField *txf_inputTextField;


@property (weak, nonatomic) IBOutlet UIButton *btn_Yes;

@property (weak, nonatomic) IBOutlet UIButton *btn_No;

@property (strong, nonatomic) NSMutableArray *btnList;

//代理对象  输入结束后将会给代理对象发送消息
@property (nonatomic , assign) id<JKZKTableViewCellDelegate> delegate;

@end
