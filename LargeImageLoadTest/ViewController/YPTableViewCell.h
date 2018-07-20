//
//  YPTableViewCell.h
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/6.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YPLargeImageView.h"

@interface YPTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet YPLargeImageView *largeImage;

+ (instancetype)cellWithTableView:(UITableView *)tableview
                        indexPath:(NSIndexPath *)indexPath ;
@end
