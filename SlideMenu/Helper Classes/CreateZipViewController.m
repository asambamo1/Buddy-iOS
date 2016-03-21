//
//  CreateZipViewController.m
//  SlideMenu
//
//  Created by Akila Sivapathasekaran on 3/7/16.
//  Copyright © 2016 Aryan Ghassemi. All rights reserved.
//

#import "CreateZipViewController.h"
#import "CreateUserAccountViewController.h"

@interface CreateZipViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *homeZipTextField;
@property (weak, nonatomic) IBOutlet UITextField *workZipTextField;
@end

@implementation CreateZipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createZipTapped:(id)sender {
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
    if ([[segue identifier] isEqualToString:@"createZipTocreateUser"])
    {
        // Get reference to the destination view controller
        CreateUserAccountViewController *vc = [segue destinationViewController];
        vc.homeZip = self.homeZipTextField.text;
        vc.workZip = self.workZipTextField.text;
    }

}

- (IBAction)nextTapped:(id)sender {
    
    if (self.homeZipTextField.text.length && self.workZipTextField.text.length) {
        [self performSegueWithIdentifier:@"createZipTocreateUser" sender:sender];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Fields" message:@"Enter the Zip codes" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


@end
