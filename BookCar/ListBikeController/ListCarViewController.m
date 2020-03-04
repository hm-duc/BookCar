//
//  ListCarViewController.m
//  BookCar
//
//  Created by nw on 2/28/20.
//  Copyright © 2020 hmduc. All rights reserved.
//

#import "ListCarViewController.h"
#import "ListCellTableViewCell.h"
@import Firebase;
@interface ListCarViewController ()
@end

@implementation ListCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.img = @[@"bike",@"bike",@"bike"];
//    self.name = @[@"Sai Gon",@"Ha Noi",@"Da Nang"];
//    self.price = @[@"50$",@"50$",@"50$"];
    
    self.img = [NSMutableArray array];
    self.name = [NSMutableArray array];
    self.price = [NSMutableArray array];
    [[[FIRFirestore firestore] collectionWithPath:@"infocar"]
    getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
      if (error != nil) {
        NSLog(@"Error getting documents: %@", error);
      } else {
          for(FIRDocumentChange *diff in snapshot.documentChanges){
              if(diff.type == FIRDocumentChangeTypeAdded){
                  [self.name addObject:diff.document.data[@"name"]];
                  [self.img addObject:diff.document.data[@"image"]];
                  [self.price addObject:diff.document.data[@"price"]];
                  [self.tableList reloadData];
              }
          }
      }
    }];
    self.tableList.delegate = self;
    self.tableList.dataSource = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.name.count;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    if(cell == nil){
        [tableView registerNib:[UINib nibWithNibName:@"ListCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"infoCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    }
    NSLog(@"image %@",self.img);
    NSLog(@"name %@",self.name);
    NSLog(@"price %@",self.price);
    cell.nameItem.text = self.name[indexPath.row];
    cell.priceItem.text = self.price[indexPath.row];
    [cell.imageItem setImage:[UIImage imageNamed:self.img[indexPath.row]]];
    return cell;
}

@end
