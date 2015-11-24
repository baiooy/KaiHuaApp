//
//  IndexReservationController.m
//  KaiHua_App
//

#import "IndexReservationController.h"
#import "DoctorListCell.h"

@interface IndexReservationController ()

@property (weak, nonatomic) IBOutlet UITableView *table_View_YuYue;

@end

@implementation IndexReservationController

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
    
    [self setViewTitle:@"约专家"];
    
    [self.table_View_YuYue registerNib:[UINib nibWithNibName:@"DoctorListCell" bundle:nil] forCellReuseIdentifier:@"DoctorListCell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    
    static NSString *CellIdentifier = @"DoctorListCell";
    DoctorListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[DoctorListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *uSB  = [UIStoryboard storyboardWithName:@"QA" bundle:nil];
    
    UIViewController * doctorView = [uSB instantiateViewControllerWithIdentifier:@"DoctorInfoViewController"];
    [doctorView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:doctorView animated:YES];
    
}



@end
