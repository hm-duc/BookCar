//
//  ListBIkeViewController.h
//  BookCar
//
//  Created by nw on 2/28/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListBIkeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong,atomic) NSArray *arrayList;

@end

NS_ASSUME_NONNULL_END
