//
//  Timinger.h
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/7/20.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timinger : NSObject

+ (instancetype)sharedTiminger ;
- (void)startTiming ;
- (void)stopTiming ;
- (void)addCount ;
@end
