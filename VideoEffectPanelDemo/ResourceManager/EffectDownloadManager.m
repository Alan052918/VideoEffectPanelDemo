//
//  EffectDownloadManager.m
//  VideoEffectPanelDemo
//
//  Created by Alan on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectDownloadManager.h"
#import "EffectPanelCollectionViewModel.h"
#import "EffectPanelCollectionViewCellModel.h"
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


- (void)bindDownloadTaskToEffectPanelCellViewModel:(nonnull EffectPanelCollectionViewModel *)viewModel cellViewModelId:(NSString *)cellViewModelId {
    EffectDownloadTask *task = [[EffectDownloadTask alloc] init];
    task.taskId = [NSString stringWithFormat:@"%ld", self.effectDownloadTaskMap.count];
    if (cellViewModelId) {
        [self.effectDownloadTaskMap setObject:task forKey:cellViewModelId];
        [task addObserver:viewModel forKeyPath:@"downloadProgressValue" options:NSKeyValueObservingOptionNew context:nil];
        NSLog(@"[%@.m] Bind cell [%@] to task [%@]", self.class, cellViewModelId, task.taskId);
    } else {
        NSLog(@"[%@.m] Fail to BIND task to cell: nil cellId", self.class);
    }
}


- (void)unbindDownloadTaskToEffectPanelCellViewModel:(nonnull EffectPanelCollectionViewModel *)viewModel cellViewModelId:(NSString *)cellViewModelId {
    if (cellViewModelId) {
        EffectDownloadTask *task = [self.effectDownloadTaskMap objectForKey:cellViewModelId];
        [task removeObserver:viewModel forKeyPath:@"downloadProgressValue" context:nil];
        NSLog(@"[%@.m] Unbind cell [%@] to task [%@]", self.class, cellViewModelId, task.taskId);
    } else {
        NSLog(@"[%@.m] Fail to UNBIND task to cell: nil cellId", self.class);
    }
}


- (Effect *)downloadEffectForEffectPanelCellViewModel:(nonnull EffectPanelCollectionViewModel *)viewModel cellViewModelId:(NSString *)cellViewModelId {
    if (cellViewModelId) {
        EffectDownloadTask *task = [self.effectDownloadTaskMap objectForKey:cellViewModelId];
        NSLog(@"[%@.m] Cell [%@] task [%@]: start downloading", self.class, cellViewModelId, task.taskId);
        Effect *effect = [task downloadEffect];
        NSLog(@"[%@.m] Cell [%@] task [%@]: download complete", self.class, cellViewModelId, task.taskId);
        return effect;
    }
    NSLog(@"[%@.m] Fail to START task to cell: nil cellId", self.class);
    return nil;
}


@end
