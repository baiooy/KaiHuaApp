//
//  HealthRecordsViewController.m
//  KaiHua_App
//

#import "HealthRecordsViewController.h"
#import <TPKeyboardAvoidingTableView.h>

#import "TJSUTableViewCell.h"
#import "JKZKTableViewCell.h"
#import "XWWXYSTableViewCell.h"


#import "CMSCoinView.h"



@interface HealthRecordsViewController ()<UITableViewDataSource,UITableViewDelegate,CoinViewDelegate,JKZKTableViewCellDelegate>

@property(weak,nonatomic) NSMutableArray *cellList;




/* 身高，体重选择器*/
@property (weak, nonatomic) IBOutlet UIView *pickView_BG;
/* 选择器标题*/
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barBtn_Title;
/* 选择器*/
@property (weak, nonatomic) IBOutlet UIPickerView *pickView_Control;


@property (weak, nonatomic) CMSCoinView *curSel_Item;
@property (weak, nonatomic) UIView *curSel_View;


/* 用户本地plist 数据*/
@property (strong, nonatomic) NSDictionary *UserPickerData;


/* 选择的体重值*/
@property(copy ,nonatomic) NSString *select_Weight;
/* 选择的身高值*/
@property(copy ,nonatomic) NSString *select_Height;
/* 选择的血压值高压*/
@property(copy ,nonatomic) NSString *select_BloodPressH;
/* 选择的血压值低压*/
@property(copy ,nonatomic) NSString *select_BloodPressL;

/* 选择的心率值*/
@property(copy ,nonatomic) NSString *select_HertRate;

@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingTableView *tbv_tableView;
@end

@implementation HealthRecordsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setViewTitle:@"健康档案"];
    
   // [self customerViewControllBgWithImage:@"img_login_Bg"];
   // [self customerLeftNavigationBarItemWithTitle:@"取消" andImageRes:nil];
    [self setMenuBtnItemWithTitle:@"取消" andImageRes:nil];
    [self customerRightNavigationBarItemWithTitle:@"完成" andImageRes:nil];
    
    _cellList = [NSMutableArray array];
    
    /* 初始化选择器*/
    [self.pickView_BG setFrame:CGRectMake(0, Screen_height, Screen_width, _pickView_BG.frame.size.height)];
    // 加载PikerView 数据
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"UserInfoData" ofType:@"plist"];
    _UserPickerData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/* 自定义TableheadView*/
-(UIView *)customerTableViewHeardViewWithDict:(NSDictionary *)dict{
    
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 44)];
    [view setBackgroundColor:[UIColor colorWithRed:223.0/255 green:223.0/255 blue:223.0/255 alpha:1]];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[dict objectForKey:@"IMG"]]];
    
    UILabel *title = [[UILabel alloc] init];
    
    [title setText:[dict objectForKey:@"TITLE"]];
    
    if (dict) {
        
        CGRect imageRect = CGRectFromString([dict objectForKey:@"IMGFRAME"]) ;
        
        CGRect titleRect = CGRectMake(50, 0, Screen_width - 20, 35);
        
        [img setFrame:imageRect];
        [title setFrame:titleRect];
        
        [title setTextColor:[UIColor colorWithRed:57.0/255 green:57.0/255 blue:57.0/255 alpha:1]];
        [title setFont:FontOthers_CH(11)];
        
        [img setCenter:CGPointMake(30,view.frame.size.height / 2)];
        
        [title setCenter:CGPointMake(30 + img.frame.size.width / 2 + titleRect.size.width / 2 + 10, view.frame.size.height / 2)];
        
        [view addSubview:img];
        [view addSubview:title];
       
    }
    
    return view;
}



/* 遍历数据查看是否已经存在Cell 对象*/
-(BOOL)isExistsItem:(NSString *)index inList:(NSMutableArray *)cellList{
   
    __block BOOL ret = NO;
    
    if (cellList.count > 0){
        for (NSObject *obj in cellList) {
            NSDictionary *dict = (NSDictionary *)obj;
            
            [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                
                NSString *key_dict = (NSString *)key;
                
                if([key_dict isEqualToString:index]) {
                   
                    ret = YES;
                    return;
                }
                
            }];
                
            
        }
        
    }
    
    return ret;
}



/* 取出当前cell 引用*/
-(UITableViewCell *)getCurrentCellFromList:(NSMutableArray *)cellList ByIndex:(NSString *)index{
    
    __block UITableViewCell *cell;
    
    for (NSObject *object in cellList) {
        NSDictionary *dict = (NSDictionary *)object;
        
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            NSString *key_dict = (NSString *)key;
            
            if([key_dict isEqualToString:index]) {
                cell = (UITableViewCell *)obj;
               return;
            }
            
        }];
        
    }
    
    return cell;
    
}




#pragma mark -- UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view ;
    if (section == 0) {
        
        NSDictionary *tjzsDict = [NSDictionary dictionaryWithObjectsAndKeys:@"体检数据",@"TITLE",@"img_Health_Profile_TJ",@"IMG",@"{{0,0},{30,20}}",@"IMGFRAME", nil];
        view = [self customerTableViewHeardViewWithDict:tjzsDict];
        
    } else if (section == 1){
        
        NSDictionary *jkzkDict = [NSDictionary dictionaryWithObjectsAndKeys:@"健康状况",@"TITLE",@"img_Health_Profile_Health",@"IMG",@"{{0,0},{22,28}}",@"IMGFRAME", nil];
        view = [self customerTableViewHeardViewWithDict:jkzkDict];
        
    } else if (section == 2){
        
        NSDictionary *xwysDict = [NSDictionary dictionaryWithObjectsAndKeys:@"行为危险因素",@"TITLE",@"img_Health_Profile_WXYS",@"IMG",@"{{0,0},{27,27}}",@"IMGFRAME", nil];
        view = [self customerTableViewHeardViewWithDict:xwysDict];
    }
    
    return view;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0){
        return 287;
    } else if (indexPath.section == 1){
        return 95;
    } else if (indexPath.section == 2){
        
        if (indexPath.row== 0) {
            return 95;
        }else{
            return 175;
        }
    }
    return 0;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0){
        return 1;
    } else if (section == 1){
        return 5;
    } else if (section == 2){
        return 2;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    NSString *cellIdentifer = [NSString stringWithFormat:@"%i-%i",indexPath.section,indexPath.row];
    
    if (indexPath.section == 0){
        
        if (![self isExistsItem:cellIdentifer inList:_cellList]){
            
        static NSString *CellIndentifier = @"TJSUTableViewCell";
        
        TJSUTableViewCell *cell = (TJSUTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
        if (cell ==  nil) {
            
            NSArray *nib=[[NSBundle mainBundle]loadNibNamed:CellIndentifier
                                                      owner:self
                                                    options:nil];
            cell=[nib objectAtIndex:0];
        }
        
        [cell setHealthRescord:self];
        [cell setTJSHViewFrame];
            
        /* 保存当前cell 引用*/
            
            NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
            [_cellList addObject:cellDict];
            
        return cell;
            
        } else {
            
            return [self getCurrentCellFromList:_cellList ByIndex:cellIdentifer];
            
            
        }
    
        
    } else if (indexPath.section == 1){
       
        
        if (![self isExistsItem:cellIdentifer inList:_cellList]){
            
            
            static NSString *CellIndentifier = @"JKZKTableViewCell";
            
            JKZKTableViewCell *cell = (JKZKTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
            if (cell ==  nil) {
                
                NSArray *nib=[[NSBundle mainBundle]loadNibNamed:CellIndentifier
                                                          owner:self
                                                        options:nil];
                cell=[nib objectAtIndex:0];
            }

            /* 保存当前cell 引用*/
            
            NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
            [_cellList addObject:cellDict];
            
            cell.delegate = self;
            
             return cell;
            
        }else {
            
            return [self getCurrentCellFromList:_cellList ByIndex:cellIdentifer];
        }

        
    } else if (indexPath.section == 2){
        
        if (indexPath.row == 0){
            
            if (![self isExistsItem:cellIdentifer inList:_cellList]){
                
                
                static NSString *CellIndentifier = @"JKZKTableViewCell";
                
                JKZKTableViewCell *cell = (JKZKTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
                if (cell ==  nil) {
                    
                    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:CellIndentifier
                                                              owner:self
                                                            options:nil];
                    cell=[nib objectAtIndex:0];
                }
                
                /* 保存当前cell 引用*/
                
                NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
                [_cellList addObject:cellDict];
                
                return cell;
                
            }else {
                
                return [self getCurrentCellFromList:_cellList ByIndex:cellIdentifer];
            }
            
            
        }else {
           
            if (![self isExistsItem:cellIdentifer inList:_cellList]){
                
                static NSString *CellIndentifier = @"XWWXYSTableViewCell";
                
                XWWXYSTableViewCell *cell = (XWWXYSTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIndentifier];
                if (cell ==  nil) {
                    
                    NSArray *nib=[[NSBundle mainBundle]loadNibNamed:CellIndentifier
                                                              owner:self
                                                            options:nil];
                    cell=[nib objectAtIndex:0];
                }
                
                
                /* 保存当前cell 引用*/
                
                NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
                [_cellList addObject:cellDict];
                
                return cell;
                
            }else{
                
                return [self getCurrentCellFromList:_cellList ByIndex:cellIdentifer];
                
            }
            
        }
        

    }
    
    return  nil;
}


//输入结束后的回调
-(void)textChanged:(NSString *)text cell:(JKZKTableViewCell *)cell
{
    NSIndexPath *indexPath = [_tbv_tableView indexPathForCell:cell];
    
    NSLog(@"section:%d row:%d %@",indexPath.section,indexPath.row,text);
}


#pragma mark -- 重载右键事件
-(void)navigationRightItemEvent{
    
}



#pragma mark -- CoinViewDelegate
-(void)coionViewToucheEventWithObj:(UIView *)view andCoinView:(UIView *)sender{
    
    _curSel_Item = (CMSCoinView *)view;
    _curSel_View = sender;

    switch (_curSel_Item.tag) {
        case CoinType_Height:{
            [_pickView_Control setTag:CoinType_Height];
            [_barBtn_Title setTitle:@"身高"];
        }
            break;
        case CoinType_Weight:{
            [_pickView_Control setTag:CoinType_Weight];
            [_barBtn_Title setTitle:@"体重"];
        }
            break;
        case CoinType_Blood_Press:{
            [_pickView_Control setTag:CoinType_Blood_Press];
            [_barBtn_Title setTitle:@"血压"];
        }
            break;
        case CoinType_blood_Herat_Rate:{
            [_pickView_Control setTag:CoinType_blood_Herat_Rate];
            [_barBtn_Title setTitle:@"心率"];
        }
            break;
            
        default:
            break;
    }
    
    [_pickView_Control reloadAllComponents];
    [_pickView_Control selectRow:10 inComponent:0 animated:YES];
    [UIView animateWithDuration:0.3f animations:^{
        
        [_pickView_BG setFrame:CGRectMake(0, Screen_height - _pickView_BG.frame.size.height - 64, Screen_width,_pickView_BG.frame.size.height )];
        
    } completion:^(BOOL finished) {
        
    }];
    
}



- (IBAction)btnPickerViewCancelEvent:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_pickView_BG setFrame:CGRectMake(0, Screen_height, Screen_width,_pickView_BG.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
}


- (IBAction)btn_PickerViewOKEvent:(id)sender {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        [_pickView_BG setFrame:CGRectMake(0, Screen_height, Screen_width,_pickView_BG.frame.size.height)];
        
    } completion:^(BOOL finished) {
        
    }];
    
    switch (_curSel_Item.tag) {
        case CoinType_Height:{
           
            if (_curSel_View.tag == 1){
                [_curSel_Item flipTouched:nil];
            }
            
            UILabel *label_Value = (UILabel *)[_curSel_Item viewWithTag:10];
            NSInteger row=[_pickView_Control selectedRowInComponent:0];
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
            [label_Value setText:[heightList objectAtIndex:row]];
            [label_Value setTextAlignment:NSTextAlignmentCenter];
            
            _select_Height = label_Value.text;
        }
            break;
        case CoinType_Weight:{
            if (_curSel_View.tag == 1){
                [_curSel_Item flipTouched:nil];
            }
            
            UILabel *label_Value = (UILabel *)[_curSel_Item viewWithTag:10];
            NSInteger row=[_pickView_Control selectedRowInComponent:0];
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_weight"];
            [label_Value setText:[heightList objectAtIndex:row]];
            [label_Value setTextAlignment:NSTextAlignmentCenter];
            
            _select_Weight = label_Value.text;
        }
            break;
        case CoinType_Blood_Press:{
            if (_curSel_View.tag == 1){
                [_curSel_Item flipTouched:nil];
            }
            
            UILabel *label_Value = (UILabel *)[_curSel_Item viewWithTag:10];
            NSInteger row=[_pickView_Control selectedRowInComponent:0];
            NSArray *hPressList= [self.UserPickerData objectForKey:@"user_bloodpressureh"];
            NSArray *lowPressList= [self.UserPickerData objectForKey:@"user_bloodpressure"];
           
            NSString *bloodPress = [NSString stringWithFormat:@"%@/%@",[hPressList objectAtIndex:row],[lowPressList objectAtIndex:[_pickView_Control selectedRowInComponent:1]]];
            [label_Value setText:bloodPress];
            [label_Value setFont:FontOthers_CH(20)];
            [label_Value setTextAlignment:NSTextAlignmentCenter];
            
            _select_BloodPressH = [hPressList objectAtIndex:row];
            _select_BloodPressL = [lowPressList objectAtIndex:[_pickView_Control selectedRowInComponent:1]];
        }
            break;
        case CoinType_blood_Herat_Rate:{
            if (_curSel_View.tag == 1){
                [_curSel_Item flipTouched:nil];
            }
            
            UILabel *label_Value = (UILabel *)[_curSel_Item viewWithTag:10];
            NSInteger row=[_pickView_Control selectedRowInComponent:0];
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_hertrate"];
            [label_Value setText:[heightList objectAtIndex:row]];
            [label_Value setTextAlignment:NSTextAlignmentCenter];
            
            _select_HertRate = label_Value.text;
        }
            break;
            
        default:
            break;
    }
    
    
    
}



#pragma UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    switch (pickerView.tag) {
        case CoinType_Blood_Press:
            return 2;
            break;
        default:
            return 1;
            break;
    }

    
    return 1;
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    if (component == 1) {
        return 160;
    }
    return 160;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    switch (pickerView.tag) {
            
        case CoinType_Height:
        {
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
            return heightList.count;
            
        }
            break;
        case CoinType_Weight:
        {
            NSArray *weightList= [self.UserPickerData objectForKey:@"user_weight"];
            return weightList.count;
        }
            break;
        case CoinType_Blood_Press:
        {
            if (component == 0){
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressureh"];
                return bloodPressList.count;
            }else{
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressure"];
                return bloodPressList.count;
            }
        }
            break;
        case CoinType_blood_Herat_Rate:
        {
            NSArray *hertRateList= [self.UserPickerData objectForKey:@"user_hertrate"];
            return hertRateList.count;
        }
            break;
        default:
            break;
    }
    
    return 0;
}



#pragma UIPickerViewDelegate
//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case CoinType_Height:
        {
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
            
            return [heightList objectAtIndex:row];
            
        }
            break;
        case CoinType_Weight:
        {
            NSArray *weightList= [self.UserPickerData objectForKey:@"user_weight"];
            
            return [weightList objectAtIndex:row];
            
        }
            break;
        case CoinType_Blood_Press:
        {
            if (component == 0){
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressureh"];
                
                return [bloodPressList objectAtIndex:row];
                
            } else {
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressure"];
                
                return [bloodPressList objectAtIndex:row];
                
            }
            
        }
            break;
        case CoinType_blood_Herat_Rate:
        {
            NSArray *hertRateList= [self.UserPickerData objectForKey:@"user_hertrate"];
            
            return [hertRateList objectAtIndex:row];
            
        }
            break;
            
        default:
            break;
    }

    return nil;
}


- (UIView *)viewForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 260, 30)];
    lab.backgroundColor = [UIColor clearColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = FontOthers_CH(16);
    
    
    return lab;
}

/*
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 260, 30)];
    lab.backgroundColor = [UIColor clearColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:18.0f];
    
    switch (pickerView.tag) {
        case CoinType_Height:
        {
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
            
            lab.text = [heightList objectAtIndex:row];
            return lab;
        }
            break;
        case CoinType_Weight:
        {
            NSArray *weightList= [self.UserPickerData objectForKey:@"user_weight"];
            
            lab.text = [weightList objectAtIndex:row];
            return lab;
        }
            break;
        case CoinType_Blood_Press:
        {
            if (component == 0){
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressure"];
                
                lab.text = [bloodPressList objectAtIndex:row];
                return lab;
            } else {
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressure"];
                
                lab.text = [bloodPressList objectAtIndex:row];
                return lab;
            }
           
        }
            break;
        case CoinType_blood_Herat_Rate:
        {
            NSArray *hertRateList= [self.UserPickerData objectForKey:@"user_hertrate"];
            
            lab.text = [hertRateList objectAtIndex:row];
            return lab;
        }
            break;
            
        default:
            break;
    }
    
 
    
    
    switch (pickerView.tag) {
        case CoinType_Height:
        {
            NSArray *heightList= [self.UserPickerData objectForKey:@"user_height"];
            
            return [heightList objectAtIndex:row];
            
        }
            break;
        case CoinType_Weight:
        {
            NSArray *weightList= [self.UserPickerData objectForKey:@"user_weight"];
            
            return [weightList objectAtIndex:row];
           
        }
            break;
        case CoinType_Blood_Press:
        {
            if (component == 0){
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressure"];
                
                return [bloodPressList objectAtIndex:row];
                
            } else {
                NSArray *bloodPressList= [self.UserPickerData objectForKey:@"user_bloodpressure"];
                
                return [bloodPressList objectAtIndex:row];
              
            }
            
        }
            break;
        case CoinType_blood_Herat_Rate:
        {
            NSArray *hertRateList= [self.UserPickerData objectForKey:@"user_hertrate"];
            
            return [hertRateList objectAtIndex:row];
        
        }
            break;
            
        default:
            break;
    }
    
    return nil;
}

   */

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    
}



@end
