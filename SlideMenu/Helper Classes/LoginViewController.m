//
//  LoginViewController.m
//  SlideMenu
//
//  Created by Akila Sivapathasekaran on 5/9/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "LoginViewController.h"
#import "NetworkingHelper.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginPressed:(id)sender {
    
    NSDictionary *parameters = @{
                                 @"phone_number":@"858-539-5954",
                                 @"email":self.usernameTextField.text,
                                 @"password":self.passwordTextField.text};
    
    [[NetworkingHelper sharedHelper] login:parameters withCompletionBlock:^(BOOL success, NSDictionary *jsonResponse, NSError *__autoreleasing *error) {
        
        if (success) {
            NSLog(@"LOGGED IN!");
        }
    }];

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
