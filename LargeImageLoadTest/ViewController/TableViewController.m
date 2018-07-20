//
//  TableViewController.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/6.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "TableViewController.h"
#import "YPLargeImageView.h"
#import "YPTableViewCell.h"
#import "ImageViewController.h"
#import "YPTableViewCell2.h"
#import "UIImageView+largeImage.h"

@interface TableViewController ()

@end

@implementation TableViewController

+ (instancetype)instanceFromStoryBoard {
    UIStoryboard *sb  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:@"TableViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"YPTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"YPTableViewCell"];
    UINib *nib2 = [UINib nibWithNibName:@"YPTableViewCell2" bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:@"YPTableViewCell2"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    self.viewDidAppearHandler();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.displayType == 21) {
        YPTableViewCell *cell =  [YPTableViewCell cellWithTableView:tableView indexPath:indexPath];
        int num = indexPath.row%3;
        NSString *name = [NSString stringWithFormat:@"%d.jpg",num];
        [cell.largeImage yp_setImageName:name];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        YPTableViewCell2 *cell =  [YPTableViewCell2 cellWithTableView:tableView indexPath:indexPath];
        int num = indexPath.row%3;
        NSString *name = [NSString stringWithFormat:@"%d.jpg",num];
        [cell.mImageView yp_setLargeImage:[UIImage imageNamed:name]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}


@end
