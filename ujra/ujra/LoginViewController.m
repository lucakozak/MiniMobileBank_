//
//  LoginViewController.m
//  ujra
//
//  Created by Kozak, Luca on 2018. 01. 17..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)loginUser:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([_usernameField.text isEqualToString:[defaults objectForKey:@"username"]]
        && [_passwordField.text isEqualToString:[defaults objectForKey:@"password"]])
    {
         [self performSegueWithIdentifier:@"gotohome" sender:self];
    }
    
    else
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Something is wrong!" message:@"Name or password is not correct!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [error show];
    }
    
}




@end
