//
//  TableViewController.h
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/6.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TBblock)(void);

@interface TableViewController : UITableViewController

@property(nonatomic, strong) TBblock viewDidAppearHandler;    
@property(nonatomic, assign) NSInteger displayType;

+ (instancetype)instanceFromStoryBoard ;

@end
