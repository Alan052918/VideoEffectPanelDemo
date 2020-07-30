//
//  EffectPanelModel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelCollectionViewModel, EffectPanelCollectionViewCellModel, Effect;
@protocol EffectPanelCollectionViewModelDelegate <NSObject>

- (void)bindDownloadTaskToEffectPanelCellViewModel:(EffectPanelCollectionViewModel *)viewModel cellViewModelId:(NSString *)cellViewModelId;
- (void)unbindDownloadTaskToEffectPanelCellViewModel:(EffectPanelCollectionViewModel *)viewModel cellViewModelId:(NSString *)cellViewModelId;
- (Effect *)downloadEffectForEffectPanelCellViewModel:(EffectPanelCollectionViewModel *)viewModel cellViewModelId:(NSString *)cellViewModelId;

@end
/// Collection view data source
@interface EffectPanelCollectionViewModel : NSObject

@property (nonatomic, strong) id <EffectPanelCollectionViewModelDelegate> delegate;

- (NSInteger)countCellViewModels;
- (EffectPanelCollectionViewCellModel *)objectAtIndex:(NSInteger)index;
- (void)addCellViewModel:(EffectPanelCollectionViewCellModel *)cellViewModel;
- (void)updateCellViewModelAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
