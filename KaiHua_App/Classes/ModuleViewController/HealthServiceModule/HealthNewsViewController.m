//
//  HealthNewsViewController.m
//  KaiHua_App

//

#import "HealthNewsViewController.h"
#import "TMQuiltView.h"
#import "HealthArticleCell.h"

#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"


#import "HealthModuleTopCell.h"
#import "HealthArticleViewController.h"

@interface HealthNewsViewController ()<TMQuiltViewDataSource,TMQuiltViewDelegate,EGORefreshTableDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    //EGOHeader
    EGORefreshTableHeaderView *_refreshHeaderView;
    //EGOFoot
    EGORefreshTableFooterView *_refreshFooterView;
    //
    BOOL _reloading;
}

//显示资讯列表的瀑布流视图  继承于 scroll view
@property (nonatomic , strong) TMQuiltView *view_newsView;

//从接口拿到的资讯列表
@property (nonatomic , strong) NSMutableArray *arr_newsArray;


//顶部显示的资讯列表
@property (weak, nonatomic) IBOutlet UICollectionView *clv_newsTypeCollectionView;

//作为所有视图的Super View
@property (weak, nonatomic) IBOutlet UIScrollView *slv_scrollView;
@end

@implementation HealthNewsViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    NSLog(@"news view frame : %@",NSStringFromCGRect(self.view_newsView.frame));
//    NSLog(@"news view content size : %@",NSStringFromCGSize(self.view_newsView.contentSize));
}


#pragma mark - 瀑布流视图 Data Source & Delegate

-(NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView
{
    //返回列数 此处应为2
    return 2;
}

-(NSInteger)quiltViewNumberOfCells:(TMQuiltView *)TMQuiltView
{
    //cell的数量  为现有的资讯数量
    return self.arr_newsArray.count;
}

-(TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath
{
    HealthArticleCell *cell = (HealthArticleCell *)[quiltView dequeueReusableCellWithReuseIdentifier:@"HealthArticleCell"];
    
    if (!cell) {
        cell = [[HealthArticleCell alloc] initWithReuseIdentifier:@"HealthArticleCell"];
    }
    
    //配置cell
    HealthArticle *healthArcticle = [HealthArticle new];
    
    NSDictionary *dic = (NSDictionary *)[self.arr_newsArray objectAtIndex:indexPath.row];
    
    healthArcticle.pictureId = [dic objectForKey:@"img"];
    healthArcticle.title = [dic objectForKey:@"title"];
    healthArcticle.content = [dic objectForKey:@"content"];
    
    CGFloat cellHeight = [cell layoutSubviewsWithHealthArticle:healthArcticle];
    
    CGRect cellFrame = cell.frame;
    cellFrame.size.height = cellHeight;
    cell.frame = cellFrame;
    
    return cell;
}

-(void)quiltView:(TMQuiltView *)quiltView didSelectCellAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select index row : %d ",indexPath.row);
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"HealthService" bundle:nil];
    HealthArticleViewController *healthArticleViewController = [uSB instantiateViewControllerWithIdentifier:@"HealthArticleViewController"];
    healthArticleViewController.articleList = _arr_newsArray;
    healthArticleViewController.articleIndex = 1;
    [healthArticleViewController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:healthArticleViewController animated:YES];
    
}

-(CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath
{
    //计算每个cell的高度 然后返回相应值
    return [self quiltView:quiltView cellAtIndexPath:indexPath].frame.size.height;
}

#pragma mark - Collection View Data Source & Delegate

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HealthModuleTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HealthModuleTopCell" forIndexPath:indexPath];
    
    //对cell的配置比较乱
    //在设置cell的frame时无效
    //目测需要在collection flow layout 里配置
    
    NSString *imageName = [[self.arr_newsTypesArray objectAtIndex:indexPath.row] objectForKey:@"typeImgSmoll"];
    UIImage *image = [UIImage imageNamed:imageName];
    cell.imv_articleTypeImageView.image = image;
    
    CGRect cellFrame = cell.frame;
    cellFrame.size.width = image.size.width;
    cell.frame = cellFrame;
    
    cell.imv_articleTypeImageView.frame = CGRectMake(0, 0, cellFrame.size.width, cellFrame.size.height);
    
    return cell;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arr_newsTypesArray.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //选中某类型资讯 刷新视图
    //更换cell的图片 更换为选中状态
    /*
     *
     *
     *
     */
}

#pragma mark - 刷新加载方法

-(void)beginToReloadData:(EGORefreshPos)aRefreshPos
{
	_reloading = YES;
    
    if (aRefreshPos == EGORefreshHeader)
	{
        //下拉刷新
        //[self refreshView];
        [self performSelector:@selector(refreshView) withObject:nil afterDelay:0.5];
        
    }else if(aRefreshPos == EGORefreshFooter)
	{
        //上提加载
        //[self loadMoreContent];
        [self performSelector:@selector(loadMoreContent) withObject:nil afterDelay:0.5];
    }
}

//刷新调用的方法
-(void)refreshView
{
	NSLog(@"刷新完成");
    
#warning 刷新代码
    /*
     *
     *这里写上刷新代码
     *
     *
     */
    
    [self finishedLoadData];
	
}
//加载调用的方法
-(void)loadMoreContent
{
    NSLog(@"加载完成");
    
#warning 加载代码
    /*
     *
     *这里写上加载代码
     *
     *
     */
    
    [self.view_newsView reloadData];
    [self removeFooterView];
    [self finishedLoadData];
}

#pragma maek - Life Cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)awakeFromNib{
    [self.slv_scrollView setFrame:CGRectMake(0, 0, Screen_width, Screen_height - 106 - 40)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if ([UIDevice currentDevice].systemVersion.intValue >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    [self setViewTitle:@"健康资讯"];
    //[self customerLeftNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];
    
    // 自定义右边键
    [self customerBaseViewRightNavigationBarItemWithTitle:nil andImageRes:@"frame_Btn_Back"];

    
    [self.clv_newsTypeCollectionView registerNib:[UINib nibWithNibName:@"HealthModuleTopCell" bundle:nil] forCellWithReuseIdentifier:@"HealthModuleTopCell"];
    
    if (self.type == InitTypeList)
    {
        //从首页列表进入
       
    }
    else if (self.type == InitTypeCommend)
    {
        //从推送消息进入
        self.clv_newsTypeCollectionView.hidden = YES;
        
        //设置右上角订阅按钮
        
        /*
         *
         *
         *
         */
    }
    
    //取得scroll view的frame,赋值给瀑布流view
    CGRect slvFrame = self.slv_scrollView.bounds;
    //slvFrame.origin.y = 64;
    slvFrame.size.height = Screen_height - 64;
    //self.slv_scrollView.frame = slvFrame;
    
    if (self.type == InitTypeList)
    {
        slvFrame.origin.y = self.clv_newsTypeCollectionView.frame.size.height;
        slvFrame.size.height -= self.clv_newsTypeCollectionView.frame.size.height;
    }
    
    self.view_newsView = [[TMQuiltView alloc] initWithFrame:slvFrame];
    self.view_newsView.dataSource = self;
    self.view_newsView.delegate = self;
    self.view_newsView.backgroundColor = [UIColor colorWithRed:239/255. green:239/255. blue:239/255. alpha:1];
    [self.slv_scrollView addSubview:self.view_newsView];
    
    
//    NSLog(@"news view frame : %@",NSStringFromCGRect(self.view_newsView.frame));
//    NSLog(@"news view content size : %@",NSStringFromCGSize(self.view_newsView.contentSize));
    
#warning 从本地获取数据 需要更换成从接口获得
    
    NSDictionary *localDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LocalData" ofType:@"plist"]];
    
    self.arr_newsTypesArray = [localDict objectForKey:@"ArticalType"];
    self.arr_newsArray = [localDict objectForKey:@"ArticalDetail"];
    
    /*
     *reload data
     */
    [self.view_newsView reloadData];
    
    //刷新加载
    [self createHeaderView];
    [self finishedLoadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 下拉刷新 & 上提加载 初始化

//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
//初始化刷新视图
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
#pragma mark
#pragma methods for creating and removing the header view

-(void)createHeaderView{
    if (_refreshHeaderView && [_refreshHeaderView superview]) {
        [_refreshHeaderView removeFromSuperview];
    }
	_refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:
                          CGRectMake(0.0f, 0.0f - self.view_newsView.bounds.size.height,
                                     self.view_newsView.frame.size.width, self.view_newsView.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    
	[self.view_newsView addSubview:_refreshHeaderView];
    
    [_refreshHeaderView refreshLastUpdatedDate];
}

-(void)finishedLoadData
{
    [self finishReloadingData];
    [self setFooterView];
}

#pragma mark -
#pragma mark method that should be called when the refreshing is finished
- (void)finishReloadingData{
	
	//  model should call this when its done loading
	_reloading = NO;
    
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.view_newsView];
    }
    
    if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:self.view_newsView];
        [self setFooterView];
    }
    
    // overide, the actula reloading tableView operation and reseting position operation is done in the subclass
}

-(void)setFooterView{
	//    UIEdgeInsets test = self.aoView.contentInset;
    // if the footerView is nil, then create it, reset the position of the footer
    CGFloat height = MAX(self.view_newsView.contentSize.height, self.view_newsView.frame.size.height);
    if (_refreshFooterView && [_refreshFooterView superview])
	{
        // reset position
        _refreshFooterView.frame = CGRectMake(0.0f,
                                              height,
                                              self.view_newsView.frame.size.width,
                                              self.view_newsView.bounds.size.height);
    }else
	{
        // create the footerView
        _refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame:
                              CGRectMake(0.0f, height,
                                         self.view_newsView.frame.size.width, self.view_newsView.bounds.size.height)];
        _refreshFooterView.delegate = self;
        [self.view_newsView addSubview:_refreshFooterView];
    }
    
    if (_refreshFooterView)
	{
        [_refreshFooterView refreshLastUpdatedDate];
    }
}

-(void)removeFooterView
{
    if (_refreshFooterView && [_refreshFooterView superview])
	{
        [_refreshFooterView removeFromSuperview];
    }
    _refreshFooterView = nil;
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	if (_refreshHeaderView)
	{
        [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
	
	if (_refreshFooterView)
	{
        [_refreshFooterView egoRefreshScrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	if (_refreshHeaderView)
	{
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
	
	if (_refreshFooterView)
	{
        [_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}

#pragma mark -
#pragma mark EGORefreshTableDelegate Methods

- (void)egoRefreshTableDidTriggerRefresh:(EGORefreshPos)aRefreshPos
{
	[self beginToReloadData:aRefreshPos];
}

- (BOOL)egoRefreshTableDataSourceIsLoading:(UIView*)view
{
	return _reloading; // should return if data source model is reloading
}

// if we don't realize this method, it won't display the refresh timestamp
- (NSDate*)egoRefreshTableDataSourceLastUpdated:(UIView*)view
{
	return [NSDate date]; // should return date data source was last changed
}



@end
