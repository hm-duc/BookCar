//
//  SplashScreenViewController.m
//  BookCar
//
//  Created by nw on 2/27/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "LoginController.h"
@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    LoginController *loginView = [[LoginController alloc]initWithNibName:@"LoginView" bundle:nil];
//
//    [self presentViewController:loginView animated:NO completion:nil];
    [self performSelector:@selector(show) withObject:nil afterDelay:2];
}

-(void) show{
    [self performSegueWithIdentifier:@"showNav" sender:self];
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
