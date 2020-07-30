//
//  EffectDownloadTask.m
//  VideoEffectPanelDemo
//
//  Created by Alan on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectDownloadTask.h"
#import "Effect.h"

@interface EffectDownloadTask ()

@end

@implementation EffectDownloadTask


- (Effect *)downloadEffect {
    for (int i = 0; i <= 10; ++i) {
        self.downloadProgressValue = 10 * i;
        NSLog(@"[%@.m] downloading effect: %ld%%", self.class, self.downloadProgressValue);
        [NSThread sleepForTimeInterval:0.3f];
    }
    Effect *effect = [[Effect alloc] init];
    return effect;
}


@end
