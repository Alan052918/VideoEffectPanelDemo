//
//  EffectPanel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelCollectionViewModel, EffectPanelCollectionViewCellModel;
@interface EffectPanelView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, assign) Class collectionViewCellClass;
@property (nonatomic, strong) EffectPanelCollectionViewModel *panelModel;
@property (nonatomic, strong) NSMutableArray <EffectPanelCollectionViewCellModel *> *selectedPanelModelUnitArray;

- (void)reloadCollectionView;
- (void)registerCellClass:(Class)cellClass;
- (void)pushUpdateSubView:(UIView *)subView withViewModel:(NSObject *)viewModel

@end

NS_ASSUME_NONNULL_END
