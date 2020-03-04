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
@property (strong,atomic) NSMutableArray *img;
@property (strong,atomic) NSMutableArray *name;
@property (strong,atomic) NSMutableArray *price;
@property (strong,atomic) NSArray *arrayData;
@end

NS_ASSUME_NONNULL_END
