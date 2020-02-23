//
//  ListItemControllerViewController.m
//  BookCar
//
//  Created by HMD on 2/23/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "ListItemControllerViewController.h"
@interface ListItemControllerViewController (){
    NSArray *listItem;
}
@end

@implementation ListItemControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    listItem = @[@"a",@"b"];
    [self.navigationItem setHidesBackButton:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableCell"];
    }
    cell.textLabel.text = [listItem objectAtIndex: indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        
    }
    if(indexPath.row == 1){
        
    }
}
@end
