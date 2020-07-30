//
//  EffectDownloadManager.m
//  VideoEffectPanelDemo
//
//  Created by Alan on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectDownloadManager.h"
#import "EffectPanelCollectionViewCell.h"
#import "EffectPanelCollectionViewModel.h"
#import "Effect.h"
#import "EffectDownloadTask.h"

@interface EffectDownloadManager ()

@property (nonatomic, strong) NSMutableDictionary <NSString *, EffectDownloadTask *> *effectDownloadTaskMap;

@end

@implementation EffectDownloadManager


- (instancetype)init {
    self = [super init];
    if (self) {
        self.effectDownloadTaskMap = [[NSMutableDictionary alloc] init];
    }
    return self;
}


- (void)bindDownloadTaskToEffectPanelCell:(nonnull EffectPanelCollectionViewCell *)cell {
    EffectDownloadTask *task = [[EffectDownloadTask alloc] init];
    task.taskId = [NSString stringWithFormat:@"%ld", self.effectDownloadTaskMap.count];
    if (cell.cellId) {
        [self.effectDownloadTaskMap setObject:task forKey:cell.cellId];
        [task addObserver:cell forKeyPath:@"downloadProgressValue" options:NSKeyValueObservingOptionNew context:nil];
        NSLog(@"[%@.m] Bind cell [%@] to task [%@]", self.class, cell.cellId, task.taskId);
    } else {
        NSLog(@"[%@.m] Fail to BIND task to cell: nil cellId", self.class);
    }
}


- (void)unbindDownloadTaskToEffectPanelCell:(nonnull EffectPanelCollectionViewCell *)cell {
    if (cell.cellId) {
        EffectDownloadTask *task = [self.effectDownloadTaskMap objectForKey:cell.cellId];
        [task removeObserver:cell forKeyPath:@"downloadProgressValue" context:nil];
        NSLog(@"[%@.m] Unbind cell [%@] to task [%@]", self.class, cell.cellId, task.taskId);
    } else {
        NSLog(@"[%@.m] Fail to UNBIND task to cell: nil cellId", self.class);
    }
}


- (Effect *)downloadEffectForEffectPanelCell:(nonnull EffectPanelCollectionViewCell *)cell {
    if (cell.cellId) {
        EffectDownloadTask *task = [self.effectDownloadTaskMap objectForKey:cell.cellId];
        NSLog(@"[%@.m] Cell [%@] task [%@]: start downloading", self.class, cell.cellId, task.taskId);
        Effect *effect = [task downloadEffect];
        NSLog(@"[%@.m] Cell [%@] task [%@]: download complete", self.class, cell.cellId, task.taskId);
        return effect;
    }
    NSLog(@"[%@.m] Fail to START task to cell: nil cellId", self.class);
    return nil;
}


@end
