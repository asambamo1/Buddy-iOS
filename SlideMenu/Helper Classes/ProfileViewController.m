
#import "ProfileViewController.h"

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return YES;
}

@end
