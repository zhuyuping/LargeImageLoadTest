//
//  Timinger.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/7/20.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "Timinger.h"
#include <sys/time.h>
#include <time.h>

@implementation Timinger

+ (instancetype)sharedTiminger {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

struct timeval sta;
struct timeval end;
int count = 0;
- (void)startTiming {
    gettimeofday(&sta, NULL);
}

- (void)stopTiming {
    gettimeofday(&end, NULL);
    long pasttime = (end.tv_sec - sta.tv_sec)*1000 + end.tv_usec/1000 - sta.tv_usec/1000;
    NSLog(@"耗时:%ld ms",pasttime);
    count = 0;
}

- (void)addCount {
    count ++;
    NSLog(@"count = %d",count);
    if (count == 64) {
        [self stopTiming];
    }
}

@end
