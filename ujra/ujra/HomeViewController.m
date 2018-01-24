//
//  HomeViewController.m
//  ujra
//
//  Created by Kozak, Luca on 2018. 01. 17..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *welcome;

@end

@implementation HomeViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}
*/

/*
- (void) setWelcome:(UILabel *)welcome
{NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *fullname = [defaults objectForKey:@"fullname"];
    self.welcome.text = fullname;}*/


- (void) setWelcome:(UILabel *)welcome
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *fullname = [defaults objectForKey:@"fullname"];
    
    _welcome = welcome;
    self.welcome.text = [NSString stringWithFormat:@"Welcome: %@", fullname];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)logout:(id)sender {
    [self performSegueWithIdentifier:@"logoutbutton" sender:self];
}

- (IBAction)deactivate:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"registered"];
    
    [self performSegueWithIdentifier:@"deactivate" sender:self];
}


@end
