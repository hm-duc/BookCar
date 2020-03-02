//
//  ListCellTableViewCell.h
//  BookCar
//
//  Created by nw on 2/28/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageItem;
@property (weak, nonatomic) IBOutlet UILabel *nameItem;
@property (weak, nonatomic) IBOutlet UILabel *priceItem;



@end

NS_ASSUME_NONNULL_END
