//
//  ViewController.m
//  BookCar
//
//  Created by nw on 2/19/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "LoginController.h"
#import "SignUpViewController.h"
#import "SVProgressHUD.h"
#import "ListItemControllerViewController.h"
@interface LoginController (){
    UIImageView *splashScreen;
}
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController setNavigationBarHidden:YES];
//    splashScreen = [[UIImageView alloc]initWithFrame:self.view.superview.frame];
//    splashScreen.image = [UIImage imageNamed:@"SplashImage"];
//    splashScreen.bounds = CGRectMake((self.view.frame.size.width/2)-(splashScreen.image.size.width)/2, (self.view.frame.size.height/2)-(splashScreen.image.size.height)/2, splashScreen.image.size.width, splashScreen.image.size.height);
//    splashScreen.backgroundColor = [UIColor whiteColor];
//    splashScreen.alpha = 0.7;
//    [self.view addSubview:splashScreen];
    
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(removeSpashScreen) userInfo:nil repeats:NO];
  
    //set Tittle navigation Bar
    self.navigationItem.title = @"Login";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
//    UIImageView *imgEmail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
//    [imgEmail setImage:[UIImage imageNamed:@"mail"]];
//    [imgEmail setContentMode:UIViewContentModeCenter];
//    self.emailTxt.leftView = imgEmail;
//    self.emailTxt.leftViewMode = UITextFieldViewModeAlways;
//    
//    UIImageView *imgLock = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
//    [imgLock setImage:[UIImage imageNamed:@"lock"]];
//    [imgLock setContentMode:UIViewContentModeCenter];
//    self.passwordTxt.leftView = imgLock;
//    self.passwordTxt.leftViewMode = UITextFieldViewModeAlways;
}


//- (void)removeSpashScreen{
//    [splashScreen removeFromSuperview];
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForS when cegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CancelBarAction:(id)sender {
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Are You Sure Want To Quit?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Quit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        exit(0);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)segueToSignUpView:(id)sender {
    SignUpViewController * signUpView = [[SignUpViewController alloc]init];
//    UINavigationController *signUpNav = [[UINavigationController alloc]initWithRootViewController:signUpView];
    [self.navigationController pushViewController:signUpView animated:YES];
}
- (IBAction)SignInAction:(id)sender {
    [SVProgressHUD showWithStatus:@"Loading..."];
    [self.view setUserInteractionEnabled:NO];
    [[FIRAuth auth]signInWithEmail:self.emailTxt.text password:self.passwordTxt.text completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if(error != nil){
            self.Errorlabel.text = error.localizedDescription;
            [SVProgressHUD dismiss];
            [self.view setUserInteractionEnabled:YES];
        }else{
            ListItemControllerViewController *listView = [ListItemControllerViewController new];
            [self.navigationController pushViewController:listView animated:YES];
            [SVProgressHUD dismiss];
            [self.view setUserInteractionEnabled:YES];
        }
    }];
}
- (IBAction)FbSignInAction:(id)sender {
    
}

@end
