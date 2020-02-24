//
//  ListItemControllerViewController.m
//  BookCar
//
//  Created by HMD on 2/23/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "ListItemControllerViewController.h"
#import "MapViewController.h"
#import "LoginController.h"
@interface ListItemControllerViewController (){
    NSArray *listItem;
}
@end

@implementation ListItemControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    listItem = @[@"Load list bike",@"Load MapView"];
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"Menu List";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImage *logoutImg = [UIImage imageNamed:@"logout-24"];
    CGRect frameimg = CGRectMake(0, 0, logoutImg.size.width, logoutImg.size.height);
    UIButton *logoutButton = [[UIButton alloc]initWithFrame:frameimg];
    [logoutButton addTarget:self action:@selector(LogoutAction) forControlEvents:UIControlEventTouchUpInside];
    
    [logoutButton setBackgroundImage:logoutImg forState:UIControlStateNormal];
    UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc]initWithCustomView:logoutButton];
    self.navigationItem.rightBarButtonItem = logoutItem;
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
        MapViewController *mapView = [MapViewController new];
        [self.navigationController pushViewController:mapView animated:YES];
    }
}

- (void)LogoutAction{
}

@end
