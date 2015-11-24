//
//  RemindMessageCell.h
//  KaiHua_App
//

#import <UIKit/UIKit.h>

@interface RemindMessageCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *doc_Ico;
@property (weak, nonatomic) IBOutlet UILabel *doc_Name;

@property (weak, nonatomic) IBOutlet UILabel *doc_ZhiCheng;

@property (weak, nonatomic) IBOutlet UILabel *doc_Content;

@property (weak, nonatomic) IBOutlet UIButton *btn_Doc_Sel;

@property (weak, nonatomic) IBOutlet UIButton *btn_UnionItem;


-(void)setRemindMessageWith:(NSDictionary *)content;

@end
