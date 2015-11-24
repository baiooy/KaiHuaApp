//
//  UserMeasureDataViewController.m
//  KaiHua_App

#import "UserMeasureDataViewController.h"
#import "Collect_Cell_Blood_Gluess.h"
#import "Collect_Cell_Blood_Press.h"
#import "Collect_Cell_Head_Rate.h"
#import "Collect_Cell_Weight.h"
#import "Collect_Cell_Pedometer.h"
#import "BaseNavViewController.h"
#import "HMSegmentedControl.h"


@interface UserMeasureDataViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectView_MeansureView;

/* 血压视图*/
@property (strong, nonatomic) IBOutlet UICollectionViewCell *collect_Cell_Blood_Pressure;

/* 血糖视图*/
@property (strong, nonatomic) IBOutlet UICollectionViewCell *collect_Cell_Blood_Gluess;

/* 心率视图*/
@property (strong, nonatomic) IBOutlet UICollectionViewCell *collect_Cell_Heat_Rate;

/* 体脂视图*/
@property (strong, nonatomic) IBOutlet UICollectionViewCell *collect_Cell_Weight;

/* 运动视图*/
@property (strong, nonatomic) IBOutlet UICollectionViewCell *collect_Cell_Pedometer;

/* 保存当前cell对象*/
@property(strong ,nonatomic) NSMutableArray *cellList;

/* SegmentControl*/
@property(strong ,nonatomic) HMSegmentedControl *segmentControl;

/* 上下滚动*/
@property (weak, nonatomic) IBOutlet UIScrollView *scv_GunGong;

@property (copy, nonatomic) NSDictionary *selection;
@end

@implementation UserMeasureDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
//        [self.navigationController.navigationBar setBackgroundImage:NavigationBar_UserCent_IMG forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:NavigationBar_HomePage_IMG forBarMetrics:UIBarMetricsDefault];
   [self.navigationController.navigationBar setBarTintColor:NavigationBar_Blue_Color];
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    /* 初始化SegmentControl*/
    [self initSegmentControls];
    
    
    
    NSLog(@"messge: %@",  [self.selection objectForKey:@"type"]);

    

   
    
    // 自定义右边键
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
        
    [self customerViewControllBgWithImage:@"img_MeasuteData_BG"];
    
    //    UIImageView *img_Bottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_MeasuteData_BG_Bottom"]];
    //    img_Bottom setFrame:CGRectMake(0, , Screen_width /2, 202);
    //
    //    img_Bottom setCenter:CGPointMake(Screen_width/2, Screen_height - img_Bottom.frame.size.height / 2);
    //    [self.view addSubview:img_Bottom];
    
    
    [self.scv_GunGong setContentSize:CGSizeMake(300, 520)];
    [self.scv_GunGong setScrollEnabled:YES];
    
    
    /* 注册Nib 事件*/
    [self registerCustomeNib];
    
    
    _cellList = [NSMutableArray array];
    
    
    
    int intString = [[self.selection objectForKey:@"type"] intValue];
     [_segmentControl updataIndicator:intString animated:YES];
    [_collectView_MeansureView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:intString inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


/* 注册Nib 事件*/
-(void)registerCustomeNib{
    // Do any additional setup after loading the view from its nib.
    UINib *nib_Blood_Gluess = [UINib nibWithNibName:@"Collect_Cell_Blood_Gluess"
                                             bundle: [NSBundle mainBundle]];
    
    [self.collectView_MeansureView registerNib:nib_Blood_Gluess forCellWithReuseIdentifier:@"Collect_Cell_Blood_Gluess"];
    
    UINib *nib_Blood_Press= [UINib nibWithNibName:@"Collect_Cell_Blood_Press"
                                           bundle: [NSBundle mainBundle]];
    
    [self.collectView_MeansureView registerNib:nib_Blood_Press forCellWithReuseIdentifier:@"Collect_Cell_Blood_Press"];
    
    // Do any additional setup after loading the view from its nib.
    UINib *nib_HeatRate = [UINib nibWithNibName:@"Collect_Cell_Head_Rate"
                                         bundle: [NSBundle mainBundle]];
    
    [self.collectView_MeansureView registerNib:nib_HeatRate forCellWithReuseIdentifier:@"Collect_Cell_Head_Rate"];
    
    UINib *nib_Weight= [UINib nibWithNibName:@"Collect_Cell_Weight"
                                      bundle: [NSBundle mainBundle]];
    
    [self.collectView_MeansureView registerNib:nib_Weight forCellWithReuseIdentifier:@"Collect_Cell_Weight"];
    
    UINib *nib_Pedometer= [UINib nibWithNibName:@"Collect_Cell_Pedometer"
                                         bundle: [NSBundle mainBundle]];
    
    [self.collectView_MeansureView registerNib:nib_Pedometer forCellWithReuseIdentifier:@"Collect_Cell_Pedometer"];
    
}


/* 初始化SegmentControl*/
-(void)initSegmentControls{
 
    _segmentControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"btn_Amesate_BloodPress", @"btn_Amesate_Hert", @"btn_Amesate_Bloodgluess", @"btn_Amesate_Weight", @"btn_Amesate_Pedometer"]];
    [_segmentControl setFrame:CGRectMake(0, -10, 180, 38)];
    
    __block UICollectionView *mesaureView = _collectView_MeansureView;

    [_segmentControl setIndexChangeBlock:^(NSUInteger index) {
        NSLog(@"Selected index %i (via block)", index);

        [mesaureView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }];
    
    [_segmentControl setSelectionIndicatorHeight:4.0f];
    [_segmentControl setBackgroundColor:[UIColor clearColor]];
    [_segmentControl setSelectionIndicatorColor:[UIColor whiteColor]];
    [_segmentControl setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
    [_segmentControl setSegmentEdgeInset:UIEdgeInsetsMake(0, 6, 0, 6)];
    [_segmentControl setTag:2];
    
    [self.navigationItem setTitleView:_segmentControl];
    
  }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(UICollectionViewCell *)getCurrentCellFromList:(NSMutableArray *)cellList ByIndex:(NSString *)index{
    
    __block UICollectionViewCell *cell;
    
    for (NSObject *object in cellList) {
        NSDictionary *dict = (NSDictionary *)object;
        
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            NSString *key_dict = (NSString *)key;
            
            if([key_dict isEqualToString:index]) {
                cell = (UICollectionViewCell *)obj;
                return;
            }
            
        }];
        
    }
    
    return cell;
    
}







#pragma mark --UICollectionViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    
    
    
    
    UICollectionViewCell *cell = [((UICollectionView *)scrollView).visibleCells firstObject];
    NSIndexPath *indexPath = [_collectView_MeansureView indexPathForCell:cell];
    
    [_segmentControl updataIndicator:indexPath.row animated:YES];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell;
    
    NSString *cellIdentifer = [NSString stringWithFormat:@"%i-%i",indexPath.section,indexPath.row];
    
//    [_segmentControl updataIndicator:indexPath.row animated:YES];
    if (![self isExistsItem:cellIdentifer inList:_cellList]){
    
        
        if (indexPath.row == 0){
            
            Collect_Cell_Blood_Press *cell = (Collect_Cell_Blood_Press*) [collectionView dequeueReusableCellWithReuseIdentifier:@"Collect_Cell_Blood_Press" forIndexPath:indexPath];
        
            [cell setBloodPressLayout];
            
            /* 保存当前cell 引用*/
            NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
            [_cellList addObject:cellDict];
            
            
            return cell;
            
            
        }else if (indexPath.row == 1){
            
            Collect_Cell_Head_Rate *cell = (Collect_Cell_Head_Rate*) [collectionView dequeueReusableCellWithReuseIdentifier:@"Collect_Cell_Head_Rate" forIndexPath:indexPath];
        
            [cell setHeatRateLayout];
            
            /* 保存当前cell 引用*/
            NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
            [_cellList addObject:cellDict];
            
            
            return cell;
            
        }else if (indexPath.row == 2){
            
            Collect_Cell_Blood_Gluess *cell = (Collect_Cell_Blood_Gluess*) [collectionView dequeueReusableCellWithReuseIdentifier:@"Collect_Cell_Blood_Gluess" forIndexPath:indexPath];
            [cell setBloodGluessLayout];
            
            /* 保存当前cell 引用*/
            NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
            [_cellList addObject:cellDict];
            
            return cell;
            
        }else if (indexPath.row == 3){
            
            Collect_Cell_Weight *cell = (Collect_Cell_Weight*) [collectionView dequeueReusableCellWithReuseIdentifier:@"Collect_Cell_Weight" forIndexPath:indexPath];
            [cell setWeightLayout];
            
            /* 保存当前cell 引用*/
            NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
            [_cellList addObject:cellDict];
            
            return cell;
            
        }else if (indexPath.row == 4){
            
            Collect_Cell_Pedometer *cell = (Collect_Cell_Pedometer*) [collectionView dequeueReusableCellWithReuseIdentifier:@"Collect_Cell_Pedometer" forIndexPath:indexPath];
            [cell setPedometerLayout];
            
            /* 保存当前cell 引用*/
            NSDictionary *cellDict = [NSDictionary dictionaryWithObjectsAndKeys:cell,cellIdentifer, nil];
            [_cellList addObject:cellDict];
            
            return cell;
            
        }
        
        
    }else{
        
         return [self getCurrentCellFromList:_cellList ByIndex:cellIdentifer];
    }
    
    

    
    return cell;
}



@end
