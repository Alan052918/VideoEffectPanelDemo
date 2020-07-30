//
//  EffectPanelModel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EffectPanelCollectionViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelCollectionViewCellModel, Effect;
/// Collection view data source
@interface EffectPanelCollectionViewModel : NSObject

- (NSInteger)countCellViewModels;
- (EffectPanelCollectionViewCellModel *)objectAtIndex:(NSInteger)index;
- (void)addCellViewModel:(EffectPanelCollectionViewCellModel *)cellViewModel;
- (void)selectCellViewModelAtIndex:(NSInteger)index;
- (void)updateCellViewModelAtIndex:(NSInteger)index effect:(Effect *)effect effectStatus:(CellViewModelEffectStatus)status;

@end

NS_ASSUME_NONNULL_END
