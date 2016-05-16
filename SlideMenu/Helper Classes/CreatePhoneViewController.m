//
//  CreatePhoneViewController.m
//  SlideMenu
//
//  Created by Akila Sivapathasekaran on 3/7/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "CreatePhoneViewController.h"
#import "CreatePasswordViewController.h"

@interface CreatePhoneViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation CreatePhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailTextField.delegate = self;
    self.phoneTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//createUserToCreatePhone
//createPhoneToCreatePassword

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"createPhoneToCreatePassword"])
    {
        // Get reference to the destination view controller
        CreatePasswordViewController *vc = [segue destinationViewController];
        vc.homeZip = self.homeZip;
        vc.workZip = self.workZip;
        vc.name = self.name;
        vc.gender = self.gender;
        vc.email = self.emailTextField.text;
        vc.phone = self.phoneTextField.text;
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)nextTapped:(id)sender {
    if (self.emailTextField.text.length && self.phoneTextField.text.length) {
        [self performSegueWithIdentifier:@"createPhoneToCreatePassword" sender:sender];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Fields" message:@"Enter the email and phone correctly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
