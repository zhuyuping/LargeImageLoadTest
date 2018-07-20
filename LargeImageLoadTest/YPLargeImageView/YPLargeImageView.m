//
//  YPLargeImageView.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/6.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "YPLargeImageView.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager+largeImage.h"
#import "Timinger.h"

@interface YPLargeImageView(){
    long long tiledCount;
    UIImage *originImage;
    CGRect imageRect;
    CGFloat imageScale_w;
    CGFloat imageScale_h;
}

@end

@implementation YPLargeImageView

- (void)yp_setImageWithUrl:(NSString *)url tiledCount:(int)tiledCount {
    tiledCount = tiledCount;
    [self yp_setImageWithUrl:url];
}

- (void)yp_setImageName:(NSString *)imageName tiledCount:(int)tiledCount {
    tiledCount = tiledCount;
    [self yp_setImageName:imageName];
}

- (void)yp_setImageWithUrl:(NSString *)url {
    [self yp_setLargeImageWithUrl:url completed:^(UIImage * _Nullable image,
                                                  NSData * _Nullable data,
                                                  NSError * _Nullable error,
                                                  SDImageCacheType cacheType,
                                                  BOOL finished,
                                                  NSURL * _Nullable imageURL) {
        if (finished && !error && image) {
            [self yp_setImage:image];
        }
        else {
            NSLog(@"YPLargeImageView error:%@",error);
        }
    }];
}

- (void)yp_setImageName:(NSString *)imageName {
    [self yp_setImage:[UIImage imageNamed:imageName]];
}

- (void)yp_setImage:(UIImage *)image {
    if (tiledCount == 0) tiledCount = 81;
    originImage = image;
    [self setBackgroundColor:[UIColor whiteColor]];
    imageRect = CGRectMake(0.0f,
                           0.0f,
                           CGImageGetWidth(originImage.CGImage),
                           CGImageGetHeight(originImage.CGImage));
    imageScale_w = self.frame.size.width/imageRect.size.width;
    imageScale_h = self.frame.size.height/imageRect.size.height;
    CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
    
    int scale = (int)MAX(1/imageScale_w, 1/imageScale_h);
    
    int lev = ceil(scale);
    tiledLayer.levelsOfDetail = 1;
    tiledLayer.levelsOfDetailBias = lev;
    
    if(tiledCount > 0){
        NSInteger tileSizeScale = sqrt(tiledCount)/2;
        CGSize tileSize = self.bounds.size;
        tileSize.width /=tileSizeScale;
        tileSize.height /=tileSizeScale;
        tiledLayer.tileSize = tileSize;
    }
}

- (void)yp_setLargeImageWithUrl:(NSString *)url completed:(SDInternalCompletionBlock)completedBlock {
    [[SDWebImageManager sharedManagerForLargeImage] loadImageWithURL:[NSURL URLWithString:url]
                                                             options:SDWebImageCacheMemoryOnly
                                                            progress:nil
                                                           completed:completedBlock];
}

+ (Class)layerClass {
    return [CATiledLayer class];
}

- (void)drawRect:(CGRect)rect {
    @autoreleasepool{
        CGRect imageCutRect = CGRectMake(rect.origin.x / imageScale_w,
                                         rect.origin.y / imageScale_h,
                                         rect.size.width / imageScale_w,
                                         rect.size.height / imageScale_h);
        CGImageRef imageRef = CGImageCreateWithImageInRect(originImage.CGImage, imageCutRect);
        UIImage *tileImage = [UIImage imageWithCGImage:imageRef];
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIGraphicsPushContext(context);
        [tileImage drawInRect:rect];
        CGImageRelease(imageRef);
        UIGraphicsPopContext();
        [Timinger.sharedTiminger addCount];
    }
}

@end
