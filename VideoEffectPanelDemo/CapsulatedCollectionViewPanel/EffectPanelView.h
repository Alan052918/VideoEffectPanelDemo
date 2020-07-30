//
//  EffectPanel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ServersideModel;
@interface EffectPanelView : UIView <UICollectionViewDelegate, UICollectionViewDataSource>

- (void)pushUpdateWithViewModel:(ServersideModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
