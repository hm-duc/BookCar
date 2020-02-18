//
//  ViewController.m
//  BookCar
//
//  Created by nw on 2/12/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "ViewController.h"
#import "NavigationBarController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *navigation = [self.navigationController navigationBar];
    [navigation setBarTintColor:[UIColor colorWithRed:0 green:1 blue:0.2 alpha:0.5]];
}

@end
