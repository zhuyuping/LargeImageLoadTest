//
//  YPTableViewCell.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/6.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "YPTableViewCell.h"

@implementation YPTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableview
                        indexPath:(NSIndexPath *)indexPath {
    YPTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"YPTableViewCell"
                                                            forIndexPath:indexPath];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"YPTableViewCell"
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
