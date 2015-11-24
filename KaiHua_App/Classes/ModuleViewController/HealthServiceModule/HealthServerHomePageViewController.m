//
//  HealthServerHomePageViewController.m
//  KaiHua_App

//

#import "HealthServerHomePageViewController.h"
#import "HealthArticleViewController.h"
#import "HealthNewsViewController.h"
#import "HealthArticleHomepageCell.h"
#import "HealthModuleCell.h"



@interface HealthServerHomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>


#pragma mark - 屏幕中间的文章展示 Collection View -

@property (weak, nonatomic) IBOutlet UICollectionView *clv_showNewsCollectionView;


#pragma mark - 屏幕下方的模块显示 Collection View -

@property (weak, nonatomic) IBOutlet UICollectionView *clv_moduleListCollectionView;


/* Page*/
@property (weak, nonatomic) IBOutlet UIPageControl *page_Controls;


/*
 *用于展示在屏幕中间的文章的数据源
 *
 *（应从接口获取）
 */
@property (nonatomic, strong) NSMutableArray *ary_newsArray;


/*
 *用于展示在屏幕下方的订阅模块的数据源
 *
 *（应从接口获取）
 */
@property (nonatomic, strong) NSMutableArray *ary_modulesArray;

@property (nonatomic, strong) NSMutableArray *arr_AtticleDetail;



@end

@implementation HealthServerHomePageViewController

#pragma mark - Collection View Data Source -

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //最后一个cell是添加定制内容
    if (collectionView == self.clv_showNewsCollectionView)
    {
        static NSString *CellIdentifier = @"HealthArticleHomepageCell";
        HealthArticleHomepageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        [cell setCellData:[_ary_newsArray objectAtIndex:indexPath.row]];
        _page_Controls.currentPage = indexPath.row;

        return  cell;
    }
    else if(collectionView == self.clv_moduleListCollectionView)
    {
        static NSString *CellIdentifier = @"HealthModuleCell";
        HealthModuleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        [cell setCellData:[_ary_modulesArray objectAtIndex:indexPath.row]];

        return  cell;
    }

       return nil;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.clv_showNewsCollectionView)
    {
        return self.ary_newsArray.count;
    }
    else if(collectionView == self.clv_moduleListCollectionView)
    {
        //最后一个cell显示添加定制内容
        return (self.ary_modulesArray.count);
    }
    
    return 0;
}


#pragma mark - Collection View Delegate -

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
    
    //新闻展示
    if (collectionView == self.clv_showNewsCollectionView)
    {
        //进入某条新闻
        
        HealthArticleViewController *healthArticleViewController = [uSB instantiateViewControllerWithIdentifier:@"HealthArticleViewController"];
        
        healthArticleViewController.articleList = _arr_AtticleDetail;
        healthArticleViewController.articleIndex = 2;
        [healthArticleViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:healthArticleViewController animated:YES];
        
        
    }//模块展示
    else if (collectionView == self.clv_moduleListCollectionView)
    {
        //进入某个模块

        HealthNewsViewController *healthNewsViewController = [uSB instantiateViewControllerWithIdentifier:@"HealthNewsViewController"];
        healthNewsViewController.type = InitTypeList;   //从首页进入
        healthNewsViewController.articleType = nil;     //当前的资讯类型
        [healthNewsViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:healthNewsViewController animated:YES];
    }
}

#pragma mark - Life Cycle -

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
	// Do any additional setup after loading the view.
    
    /* 注册Nib */
    UINib *nib_News = [UINib nibWithNibName:@"HealthArticleHomepageCell"
                                             bundle: [NSBundle mainBundle]];
    
    [self.clv_showNewsCollectionView registerNib:nib_News forCellWithReuseIdentifier:@"HealthArticleHomepageCell"];
    

    UINib *nib_Modules = [UINib nibWithNibName:@"HealthModuleCell"
                                     bundle: [NSBundle mainBundle]];
    
    [self.clv_moduleListCollectionView registerNib:nib_Modules forCellWithReuseIdentifier:@"HealthModuleCell"];

    
    [self getRemindDataFromServer];
}


/* 获得提醒数据*/
-(void)getRemindDataFromServer{
    
    _ary_modulesArray = [NSMutableArray array];
    _ary_newsArray  = [NSMutableArray array];
    _arr_AtticleDetail = [NSMutableArray array];
    
    NSDictionary *localDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LocalData" ofType:@"plist"]];
    
    _ary_modulesArray = [localDict objectForKey:@"ArticalType"];
    _ary_newsArray = [localDict objectForKey:@"ArticalBanner"];
    _arr_AtticleDetail = [localDict objectForKey:@"ArticalDetail"];
    
    /* news页码*/
    [_page_Controls setNumberOfPages:_ary_newsArray.count];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
