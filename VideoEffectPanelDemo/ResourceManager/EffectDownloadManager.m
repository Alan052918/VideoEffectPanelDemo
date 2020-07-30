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

@interface EffectDownloadManager () <EffectPanelCollectionViewModelDelegate>

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


- (void)bindDownloadTaskToEffectPanelCellViewModel:(nonnull EffectPanelCollectionViewCellModel *)cellViewModel {
    EffectDownloadTask *task = [[EffectDownloadTask alloc] init];
    task.taskId = [NSString stringWithFormat:@"%ld", self.effectDownloadTaskMap.count];
    if (cellViewModel.cellViewModelId) {
        [self.effectDownloadTaskMap setObject:task forKey:cellViewModel.cellViewModelId];
        [task addObserver:cellViewModel forKeyPath:@"downloadProgressValue" options:NSKeyValueObservingOptionNew context:nil];
        NSLog(@"[%@.m] Bind cell [%@] to task [%@]", self.class, cellViewModel.cellViewModelId, task.taskId);
    } else {
        NSLog(@"[%@.m] Fail to BIND task to cell: nil cellId", self.class);
    }
}


- (void)unbindDownloadTaskToEffectPanelCellViewModel:(nonnull EffectPanelCollectionViewCellModel *)cellViewModel {
    if (cellViewModel.cellViewModelId) {
        EffectDownloadTask *task = [self.effectDownloadTaskMap objectForKey:cellViewModel.cellViewModelId];
        [task removeObserver:cellViewModel forKeyPath:@"downloadProgressValue" context:nil];
        NSLog(@"[%@.m] Unbind cell [%@] to task [%@]", self.class, cellViewModel.cellViewModelId, task.taskId);
    } else {
        NSLog(@"[%@.m] Fail to UNBIND task to cell: nil cellId", self.class);
    }
}


- (Effect *)downloadEffectForEffectPanelCellViewModel:(nonnull EffectPanelCollectionViewCellModel *)cellViewModel {
    if (cellViewModel.cellViewModelId) {
        EffectDownloadTask *task = [self.effectDownloadTaskMap objectForKey:cellViewModel.cellViewModelId];
        NSLog(@"[%@.m] Cell [%@] task [%@]: start downloading", self.class, cellViewModel.cellViewModelId, task.taskId);
        Effect *effect = [task downloadEffect];
        NSLog(@"[%@.m] Cell [%@] task [%@]: download complete", self.class, cellViewModel.cellViewModelId, task.taskId);
        return effect;
    }
    NSLog(@"[%@.m] Fail to START task to cell: nil cellId", self.class);
    return nil;
}


@end
