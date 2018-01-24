//
//  ActivationViewController.m
//  ujra
//
//  Created by Kozak, Luca on 2018. 01. 17..
//  Copyright © 2018. Kozak, Luca. All rights reserved.
//

#import "ActivationViewController.h"
#import <CommonCrypto/CommonHMAC.h>

@interface ActivationViewController ()



@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *fullnameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *passwordagainField;



@end


@implementation ActivationViewController

-(BOOL) validateEmail:(NSString *)candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}




- (void)viewDidLoad {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"registered"])
    {
        NSLog(@"No user is regsitered");
    }
    else
    {
        NSLog(@"User is registered");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)registerUser:(id)sender {
    if ([ _usernameField.text isEqualToString:@""] ||
        [ _fullnameField.text isEqualToString:@""] ||
        [ _emailField.text isEqualToString:@""]    ||
        [ _passwordField.text isEqualToString:@""] ||
        [ _passwordagainField.text isEqualToString:@""]
        || ![self validateEmail:[_emailField text]])
        
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Something is wrong!" message:@"You must complete all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    else
    {
        [self checkPassword];
    }
}


/*--(void) checkEmail {
    NSString *string = @"shannoga@me.com";
    NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
    if (match){
        [self checkPassword];
        //NSLog(@"yes");
    }else
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Something is wrong!" message:@"Your email adress is not correct$" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
        //NSLog(@"no");
    }
}



 (void) setEmail:(UILabel *)email
{
    _emailField = email;
    self.emailField.text = [NSString stringWithFormat:@"%@ @ %@ . %@"];
}


{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *
}


- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //	return 0;
    return [emailTest evaluateWithObject:candidate];
}



/*-(BOOL) validEmailAddress:(NSString*) emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
  

    BOOL bEmailValid = [self validEmailAddress:_emailField.text];
    if(bEmailValid)
    {
        [self checkPassword];
    }
    else
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Something is wrong!" message:@"Your email adress is not correct$" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
}

-(void) checkEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailValidation evaluateWithObject: emailRegex])
    {
        [self checkPassword];
    }
    else
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Something is wrong!" message:@"Your email adress is not correct$" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
}*/


- (void) checkPassword {
    if ([_passwordField.text isEqualToString:_passwordagainField.text])
    {
        NSLog(@"Passwords match");
        [self registerNewUser];
    }
    else
    {
        NSLog(@"passwords don't match");
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Something is wrong!" message:@"Your entered passwords do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    
}


 /*-(void) registersecretNewUser {
 NSManagedObjectContext *context = [self managedObjectContext];
 NSManagedObjectModel *transaction = [kSecAttrDescription insertNewObjectForEntityForName:@"Data" inManagedObjectContext:context];
 
 
 [transaction setValue:self.usernameField.text forKey:@"username"];
 [transaction setValue:self.fullnameField.text forKey:@"fullname"];
 [transaction setValue:self.passwordField.text forKey:@"password"];
 
 // Save the context
 NSError *error = nil;
 if (![context save:&error]) {
 NSLog(@"Save Failed! %@ %@", error, [error localizedDescription]);
 }
  
  -(void) saveCoreData {
  
  NSManagedObjectContext *context = [self managedObjectContext];
  NSManagedObject *transaction = [NSEntityDescription insertNewObjectForEntityForName:@"Shruti" inManagedObjectContext:context];
  
  NSManagedObject *name = [NSEntityDescription insertNewObjectForEntityForName:@"name" inManagedObjectContext:context];
  NSManagedObject *email = [NSEntityDescription insertNewObjectForEntityForName:@"email" inManagedObjectContext:context];
  NSManagedObject *dob = [NSEntityDescription insertNewObjectForEntityForName:@"dob" inManagedObjectContext:context];
  
  [name setValue:self.nameTextField.text forKey:@"name"];
  [email setValue:self.emailTextField.text forKey:@"email"];
  [dob setValue:self.dobTextField.text forKey:@"dob"];
  
  NSLog(@"Switch is On and data is saved in Core Data");
  
  TableViewController *objOfView = [[TableViewController alloc]initWithNibName:@"TableViewController" bundle:nil];
  [self.navigationController pushViewController:objOfView animated:YES];
  
  
 }*/


- (void) registerNewUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_usernameField.text forKey:@"username"];
    [defaults setObject:_fullnameField.text forKey:@"fullname"];
    [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    [defaults synchronize];
    
    NSString *passw=[[NSString alloc] initWithString:_passwordField.text];
    unsigned char result[64];
    CC_SHA256([passw UTF8String], [passw lengthOfBytesUsingEncoding:NSASCIIStringEncoding],result);
    NSLog(@"%s", result);
    
    [self performSegueWithIdentifier:@"activationbutton" sender:self];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have registered a new user" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [success show];
    
   /* NSString *plainString = @"This string will be encrypted";
    NSString *key = @"password"; 
    
    NSLog( @"Original String: %@", plainString );
    
    NSString *encryptedString = [plainString AES256EncryptWithKey:key];
    NSLog( @"Encrypted String: %@", encryptedString );
    
    NSLog( @"Decrypted String: %@", [encryptedString AES256DecryptWithKey:key] );
 */
    }


    @end

