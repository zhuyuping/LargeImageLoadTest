//
//  SDWebImageManager+largeImage.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/6/5.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "SDWebImageManager+largeImage.h"
#import "SDImageCache+largeImage.h"
#import "SDWebImageDownloader+largeImage.h"

@implementation SDWebImageManager (largeImage)

+ (instancetype)sharedManagerForLargeImage {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (nonnull instancetype)init {
    SDImageCache *cache = [SDImageCache sharedImageCacheForLargeImage];
    cache.config.shouldDecompressImages = NO;
    cache.config.shouldCacheImagesInMemory = NO;
    SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloaderForLargeImage];
    downloader.shouldDecompressImages = NO;
    return [self initWithCache:cache downloader:downloader];
}

@end
