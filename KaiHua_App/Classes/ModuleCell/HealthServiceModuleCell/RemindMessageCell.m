//
//  RemindMessageCell.m
//  KaiHua_App

//

#import "RemindMessageCell.h"

@implementation RemindMessageCell




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [_btn_Doc_Sel setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setRemindMessageWith:(NSDictionary *)content{
    
    if (content){
        int remindType = [[content objectForKey:@"remind_Type"] intValue];
        
         [_doc_Name setText:[content objectForKey:@"doc_Name"]];
         [_doc_ZhiCheng setText:[content objectForKey:@"doc_ZhiCheng"]];
         [_doc_Ico setImage:[UIImage imageNamed:[content objectForKey:@"doc_Ico"]]];
        
        switch (remindType) {
            case 1:{
                [_doc_Content setText:[content objectForKey:@"remind_Content"]];
                [_btn_UnionItem setHidden:YES];

            }
                
                break;
            case 2:{
                [_doc_Content setText:[content objectForKey:@"remind_Content"]];
                [_btn_UnionItem setHidden:NO];
                
                //重绘制Frame
                [_btn_UnionItem setTag:remindType];
                [_btn_UnionItem setTitle:[content objectForKey:@"union_Title"] forState:UIControlStateNormal];
            }
                
                break;
            case 3:{
                [_doc_Content setText:[content objectForKey:@"remind_Content"]];
                [_btn_UnionItem setHidden:NO];
                //重绘制Frame
                [_btn_UnionItem setTag:remindType];
                [_btn_UnionItem setTitle:[content objectForKey:@"union_Title"] forState:UIControlStateNormal];

            }
                
                break;
            default:
                break;
        }
    }
    
}

@end
