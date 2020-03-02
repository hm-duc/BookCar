//
//  ListCarViewController.m
//  BookCar
//
//  Created by nw on 2/28/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "ListCarViewController.h"
#import "ListCellTableViewCell.h"
@interface ListCarViewController ()
@end

@implementation ListCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.img = @[@"bike",@"bike",@"bike"];
    self.name = @[@"Sai Gon",@"Ha Noi",@"Da Nang"];
    self.price = @[@"50$",@"50$",@"50$"];
    self.tableList.delegate = self;
    self.tableList.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.name.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    if(cell == nil){
        [tableView registerNib:[UINib nibWithNibName:@"ListCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"infoCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    }
    cell.nameItem.text = self.name[indexPath.row];
    cell.priceItem.text = self.price[indexPath.row];
    [cell.imageItem setImage:[UIImage imageNamed:self.img[indexPath.row]]];
    return cell;
}

@end
