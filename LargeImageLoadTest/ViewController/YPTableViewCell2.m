//
//  YPTableViewCell2.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/7/20.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "YPTableViewCell2.h"

@implementation YPTableViewCell2

+ (instancetype)cellWithTableView:(UITableView *)tableview
                        indexPath:(NSIndexPath *)indexPath {
    YPTableViewCell2 *cell = [tableview dequeueReusableCellWithIdentifier:@"YPTableViewCell2"
                                                            forIndexPath:indexPath];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"YPTableViewCell2"
                                             owner:nil
                                           options:nil].firstObject;
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        self.contentView.backgroundColor = [UIColor grayColor];
    }
    else {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
}

@end
