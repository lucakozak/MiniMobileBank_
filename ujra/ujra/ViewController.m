//
//  ViewController.m
//  ujra
//
//  Created by Kozak, Luca on 2018. 01. 16..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)startbutton:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:@"registered"])
    {
        NSLog(@"No user is regsitered");
        
        [self performSegueWithIdentifier:@"firstactivation" sender:self];
    }
    
    else
    {
        NSLog(@"user is registered");
        
        [self performSegueWithIdentifier:@"activatedlogin" sender:self];
        
    }

}


@end
