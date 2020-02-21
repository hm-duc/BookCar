//
//  ViewController.m
//  BookCar
//
//  Created by nw on 2/12/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "ItemTextFieldLoginController.h"
@interface ItemTextFieldLoginController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ItemTextFieldLoginController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)customInit{
    [[NSBundle mainBundle] loadNibNamed:@"ItemTextFieldLoginController" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

@end
