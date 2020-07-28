//
//  EffectDownloadManager.m
//  VideoEffectPanelDemo
//
//  Created by Alan on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectDownloadManager.h"
#import "EffectPanelCollectionViewCell.h"
#import "Effect.h"
#import "EffectDownloadTask.h"

@interface EffectDownloadManager ()

@property (nonatomic, strong) NSMutableDictionary <EffectPanelCollectionViewCell *, EffectDownloadTask *> *effectDownloadTaskMap;

@end

@implementation EffectDownloadManager


- (instancetype)init {
    self = [super init];
    if (self) {
        self.effectDownloadTaskMap = [[NSMutableDictionary alloc] init];
    }
    return self;
}


- (void)addDownloadTaskForCell:(EffectPanelCollectionViewCell *)cell {
    EffectDownloadTask *task = [[EffectDownloadTask alloc] init];
}


@end
