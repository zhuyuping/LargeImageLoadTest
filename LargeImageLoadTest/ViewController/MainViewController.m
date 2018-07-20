//
//  MainViewController.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/7/20.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "MainViewController.h"
#import "ImageViewController.h"
#import "TableViewController.h"

@interface MainViewController ()

@property (nonatomic, copy)NSArray <NSArray *>*dataList;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - set get

- (NSArray <NSArray *>*)dataList {
    if (!_dataList) {
        _dataList = @[@[@"UIKit-setImage",@"苹果推荐的分片比例裁剪方式",@"CATiledLayer方式"],@[@"SDImage",@"苹果推荐的分片比例裁剪方式",@"CATiledLayer"],@[@"苹果推荐的分片比例裁剪方式",@"CATiledLayer方式"]];
    }
    return _dataList;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList[section].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray <NSString *>*titles = @[@"本地加载图片",@"下载加载图片",@"下载加载图片(表格内使用)"];
    return titles[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainViewControllerCell" forIndexPath:indexPath];
   cell.textLabel.text  = self.dataList[indexPath.section][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section < 2) {
        ImageViewController *imageVC = [ImageViewController new];
        imageVC.displayType = indexPath.section * 10 + indexPath.row;
        [self.navigationController pushViewController:imageVC animated:YES];
    }
    else {
        TableViewController *tableVC = [TableViewController instanceFromStoryBoard];
        tableVC.displayType = indexPath.section * 10 + indexPath.row;
        [self.navigationController pushViewController:tableVC animated:YES];
    }
}

@end
