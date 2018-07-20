//
//  YPLargeImageView.h
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/6.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPLargeImageView : UIView

- (void)yp_setImageWithUrl:(NSString *)url ;
- (void)yp_setImageName:(NSString *)imageName ;

// tiledCount 表示需要放大多少遍才能达到原始图片尺寸 default 100
- (void)yp_setImageWithUrl:(NSString *)url tiledCount:(int)tiledCount ;
- (void)yp_setImageName:(NSString *)imageName tiledCount:(int)tiledCount ;

@end
