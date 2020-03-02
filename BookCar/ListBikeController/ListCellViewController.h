//
//  ListCellViewController.h
//  BookCar
//
//  Created by nw on 2/28/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListCellViewController : UIView

@property (weak,atomic) NSString *img;
@property (weak,atomic) NSString *name;
@property (weak,atomic) NSString *price;

@end

NS_ASSUME_NONNULL_END
