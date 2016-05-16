//
//  CreateUserAccountViewController.m
//  SlideMenu
//
//  Created by Akila Sivapathasekaran on 3/7/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "CreateUserAccountViewController.h"
#import "CreatePhoneViewController.h"

@interface CreateUserAccountViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;

@end

@implementation CreateUserAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField.delegate = self;
    self.genderTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"createUserToCreatePhone"])
    {
        // Get reference to the destination view controller
        CreatePhoneViewController *vc = [segue destinationViewController];
        vc.homeZip = self.homeZip;
        vc.workZip = self.workZip;
        vc.name = self.nameTextField.text;
        vc.gender = self.genderTextField.text;
    }
    
}

- (IBAction)nextTapped:(id)sender {
    if (self.nameTextField.text.length && self.genderTextField.text.length) {
        [self performSegueWithIdentifier:@"createUserToCreatePhone" sender:sender];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Fields" message:@"Enter the name and gender correctly" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
