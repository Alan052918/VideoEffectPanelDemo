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
//@property (nonatomic, strong) NSMutableArray <EffectPanelCollectionViewCellModel *> *selectedCellViewModels;

- (EffectPanelCollectionViewCellModel *)copyCellViewModel:(EffectPanelCollectionViewCellModel *)cellViewModel withEffect:(Effect *)effect cellViewModelEffectStatus:(CellViewModelEffectStatus)status;

@end

@implementation EffectPanelCollectionViewModel


- (instancetype)init {
    self = [super init];
    if (self) {
        self.collectionViewCellModels = [[NSMutableArray alloc] init];
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


- (void)selectCellViewModelAtIndex:(NSInteger)index {
    EffectPanelCollectionViewCellModel *targetCellViewModel = [self.collectionViewCellModels objectAtIndex:index];
    targetCellViewModel.selected = targetCellViewModel.isSelected ? NO : YES;
    if (!targetCellViewModel.cellViewModelEffect) {
        if (targetCellViewModel.isSelected) {
            [self updateCellViewModelAtIndex:index effect:targetCellViewModel.cellViewModelEffect effectStatus:CellViewModelEffectDownloading];
            NSLog(@"[%@.m] Cell selected, download beginned", self.class);
        } else {
            [self updateCellViewModelAtIndex:index effect:targetCellViewModel.cellViewModelEffect effectStatus:CellViewModelEffectUncached];
            NSLog(@"[%@.m] Cell selected, download cancelled", self.class);
        }
    } else if (targetCellViewModel.isSelected) {
        NSLog(@"[%@.m] Cell selected, effect applied", self.class);
    }
}


- (void)updateCellViewModelAtIndex:(NSInteger)index effect:(Effect *)effect effectStatus:(CellViewModelEffectStatus)status {
    [self.collectionViewCellModels replaceObjectAtIndex:index withObject:[self copyCellViewModel:[self.collectionViewCellModels objectAtIndex:index] withEffect:effect cellViewModelEffectStatus:status]];
}


- (EffectPanelCollectionViewCellModel *)copyCellViewModel:(EffectPanelCollectionViewCellModel *)cellViewModel withEffect:(Effect *)effect cellViewModelEffectStatus:(CellViewModelEffectStatus)status {
    EffectPanelCollectionViewCellModel *newModel = [[EffectPanelCollectionViewCellModel alloc] init];
    newModel.cellViewModelId = cellViewModel.cellViewModelId;
    newModel.cellViewModelName = cellViewModel.cellViewModelName;
    newModel.cellViewModelImageUrl = cellViewModel.cellViewModelImageUrl;
    newModel.selected = cellViewModel.isSelected;
    newModel.cellViewModelEffectStatus = status;
    newModel.cellViewModelEffect = effect;
    return newModel;
}


@end
