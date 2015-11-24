//
//  QuestionList_Presert_DocController.m
//  KaiHua_App
//

#import "QuestionList_Personal_DocController.h"
#import "QuestionList_PersonalCell.h"


@interface QuestionList_Personal_DocController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QuestionList_Personal_DocController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib{
    
    [self.view setFrame:CGRectMake(0, 0, Screen_width, Screen_height - 104)];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    
    static NSString *CellIdentifier = @"QuestionList_PersonalCell";
    QuestionList_PersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[QuestionList_PersonalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"QADetailViewController"];
    [doctorView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:doctorView animated:YES];
    
}



@end
