//
//  EffectPanel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelModel;
@interface EffectPanel : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) EffectPanelModel *panelModel;
@property (nonatomic, assign) Class collectionViewCellClass;

- (void)reloadCollectionView;
- (void)registerCellClass:(Class)cellClass;

@end

NS_ASSUME_NONNULL_END
