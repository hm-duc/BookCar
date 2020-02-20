//
//  ViewController.h
//  BookCar
//
//  Created by nw on 2/19/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *CancelBarButton;
@property (weak, nonatomic) IBOutlet UIButton *FaceBookButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;

@end

NS_ASSUME_NONNULL_END
