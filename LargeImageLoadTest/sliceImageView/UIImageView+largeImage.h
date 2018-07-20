//
//  UIImageView+largeImage.h
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/5/31.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YPLargeImageView.h"

@interface UIImageView (largeImage)

- (void)yp_setLargeImageWithUrl:(NSString *)url ;
- (void)yp_setLargeImageWithName:(NSString *)imageName ;
- (void)yp_setLargeImage:(UIImage *)image ;

@end

