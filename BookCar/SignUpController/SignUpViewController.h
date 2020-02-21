//
//  SignUpViewController.h
//  BookCar
//
//  Created by nw on 2/20/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
NS_ASSUME_NONNULL_BEGIN

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ErrorLabel;
@property (weak, nonatomic) IBOutlet UITextField *EmailTxt;
@property (weak, nonatomic) IBOutlet UITextField *PassTxt;

@end

NS_ASSUME_NONNULL_END
