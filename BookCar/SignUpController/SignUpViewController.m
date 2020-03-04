//
//  SignUpViewController.m
//  BookCar
//
//  Created by nw on 2/20/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "SignUpViewController.h"
#import "SVProgressHUD.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Member registartion";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)SignUpAction:(id)sender {
    [SVProgressHUD showWithStatus:@"Loading..."];
    
    FIRFirestore *db = [FIRFirestore firestore];
    [[[db collectionWithPath:@"user"] documentWithPath:@"info"]setData:@{
        @"phone" : self.PhoneTxt.text
    }merge:YES completion:^(NSError * _Nullable error) {
        if(error != nil){
            self.ErrorLabel.text = error.localizedDescription;
        }
    }];
    
    [[FIRAuth auth] createUserWithEmail:self.EmailTxt.text password:self.PassTxt.text completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
        if(error != nil){
            self.ErrorLabel.text = error.localizedDescription;
            [SVProgressHUD dismiss];
        }else{
            self.ErrorLabel.text = @"Sign Up Success!!";
            [SVProgressHUD dismiss];
        }
    }];
    
}

@end
