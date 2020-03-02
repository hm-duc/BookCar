//
//  ListCarViewController.h
//  BookCar
//
//  Created by nw on 2/28/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListCarViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableList;
@property (strong,atomic) NSArray *img;
@property (strong,atomic) NSArray *name;
@property (strong,atomic) NSArray *price;
@end

NS_ASSUME_NONNULL_END
