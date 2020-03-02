//
//  ListBIkeViewController.m
//  BookCar
//
//  Created by nw on 2/28/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "ListBIkeViewController.h"
#import "ListCellViewController.h"
@interface ListBIkeViewController (){
    ListCellViewController *listCell;
}
@end

@implementation ListBIkeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    listCell = [ListCellViewController new];
    listCell.img = @"bike";
    listCell.name = @"Viet Nam";
    listCell.price = @"50$";
    
    
    self.arrayList = [[NSMutableArray alloc]initWithObjects:listCell,listCell,listCell,listCell,listCell, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    } 
    listCell = [self.arrayList objectAtIndex:indexPath.row];
    UIImageView *img = (UIImageView *)[cell viewWithTag:1];
    img.image = [ UIImage imageNamed:listCell.img];
    
    UILabel *name = (UILabel *)[cell viewWithTag:2];
    name.text = listCell.name;
    
    UILabel *pirce = (UILabel *)[cell viewWithTag:3];
    pirce.text = listCell.price;
    return cell;
}

@end
