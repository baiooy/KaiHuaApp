//
//  HealthTestpaperViewController.m
//  KaiHua_App
//

//

#import "HealthTestpaperViewController.h"

@interface HealthTestpaperViewController ()

@end

@implementation HealthTestpaperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)awakeFromNib{
    
    [self.view setFrame:CGRectMake(0, 0, Screen_width, Screen_height - 106 - 40)];
    
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

@end
