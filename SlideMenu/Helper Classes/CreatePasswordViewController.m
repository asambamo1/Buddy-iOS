//
//  CreatePasswordViewController.m
//  SlideMenu
//
//  Created by Akila Sivapathasekaran on 3/7/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "CreatePasswordViewController.h"
#import "NetworkingHelper.h"
#import "HomeViewController.h"

@interface CreatePasswordViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@end

@implementation CreatePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passwordTextField.delegate = self;
    self.confirmPasswordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)createAccountTapped:(id)sender {
    
    if (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Password mismatch" message:@"Enter the same password on both fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }else{
        
        NSDictionary *parameters = @{@"name": self.name,
                                     @"about_me":@"hiii",
                                     @"src_zip":self.homeZip,
                                     @"dest_zip":self.workZip,
                                     @"phone_number":self.phone,
                                     @"email":self.email,
                                     @"gender":self.gender,
                                     @"password":self.passwordTextField.text};
        
       [[NetworkingHelper sharedHelper] createAccount:parameters withCompletionBlock:^(BOOL success, NSDictionary *jsonResponse, NSError *__autoreleasing *error) {
           
           if (success) {
               NSLog(@"User Created");
               
               HomeViewController *homeVC = [[HomeViewController alloc] init];
               UINavigationController *navController = [UIApplication sharedApplication].keyWindow.rootViewController.navigationController;
               [navController pushViewController:homeVC animated:YES];
           }
       }];
        
    }
}

@end
