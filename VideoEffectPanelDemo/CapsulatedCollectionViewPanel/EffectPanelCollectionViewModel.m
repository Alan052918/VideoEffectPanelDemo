//
//  EffectPanelModel.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanelCollectionViewModel.h"
#import "EffectPanelCollectionViewCellModel.h"

@interface EffectPanelCollectionViewModel ()

@property (nonatomic, strong) NSMutableArray <EffectPanelCollectionViewCellModel *> *collectionViewCellModels;
@property (nonatomic, strong) NSMutableDictionary <NSString *, EffectPanelCollectionViewCellModel *> *selectedCellViewModels;

@end

@implementation EffectPanelCollectionViewModel


- (instancetype)init {
    self = [super init];
    if (self) {
        self.collectionViewCellModels = [[NSMutableArray alloc] init];
        self.selectedCellViewModels = [[NSMutableDictionary alloc] init];
    }
    return self;
}


- (NSInteger)countCellViewModels {
    return self.collectionViewCellModels.count;
}


- (EffectPanelCollectionViewCellModel *)objectAtIndex:(NSInteger)index {
    return [self.collectionViewCellModels objectAtIndex:index];
}


- (void)addCellViewModel:(EffectPanelCollectionViewCellModel *)cellViewModel {
    [self.collectionViewCellModels addObject:cellViewModel];
}


- (void)updateCellViewModelAtIndex:(NSInteger)index {
    EffectPanelCollectionViewCellModel *targetCellViewModel = [self.collectionViewCellModels objectAtIndex:index];
    targetCellViewModel.selected = targetCellViewModel.isSelected ? NO : YES;
    if (!targetCellViewModel.cellViewModelEffect) {
        if (targetCellViewModel.isSelected) {
            [self.selectedCellViewModels setObject:targetCellViewModel forKey:targetCellViewModel.cellViewModelId];
//            [self.delegate bindDownloadTaskToEffectPanelCellViewModel:self cellViewModelId:targetCellViewModel.cellViewModelId];
            NSLog(@"[%@.m] Cell [%@] selected, download beginned", self.class, targetCellViewModel.cellViewModelName);
//            [self.delegate downloadEffectForEffectPanelCellViewModel:self cellViewModelId:targetCellViewModel.cellViewModelId];
//            [self.delegate unbindDownloadTaskToEffectPanelCellViewModel:self cellViewModelId:targetCellViewModel.cellViewModelId];
        } else {
            [self.selectedCellViewModels removeObjectForKey:targetCellViewModel.cellViewModelId];
            NSLog(@"[%@.m] Cell [%@] selected, download cancelled", self.class, targetCellViewModel.cellViewModelName);
        }
    } else if (targetCellViewModel.isSelected) {
        [self.selectedCellViewModels setObject:targetCellViewModel forKey:targetCellViewModel.cellViewModelId];
        NSLog(@"[%@.m] Cell [%@] selected, effect applied", self.class, targetCellViewModel.cellViewModelName);
    }
}


//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//}


@end
