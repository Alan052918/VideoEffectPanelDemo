//
//  EffectDownloadTask.m
//  VideoEffectPanelDemo
//
//  Created by Alan on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectDownloadTask.h"

@implementation EffectDownloadTask


- (void)startDownloadingEffect {
    for (int i = 0; i < 10; ++i) {
        
        [NSThread sleepForTimeInterval:0.1f];
    }
}


@end
