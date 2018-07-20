//
//  SDWebImageDownloader+largeImage.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/5.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "SDWebImageDownloader+largeImage.h"

@implementation SDWebImageDownloader (largeImage)

+ (instancetype)sharedDownloaderForLargeImage {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

@end
