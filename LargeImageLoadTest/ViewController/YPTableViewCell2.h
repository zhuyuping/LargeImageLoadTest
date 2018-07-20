//
//  YPTableViewCell2.h
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/7/20.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPTableViewCell2 : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mImageView;

+ (instancetype)cellWithTableView:(UITableView *)tableview
                        indexPath:(NSIndexPath *)indexPath;
@end
