//
//  EffectPanelCollectionViewCell.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelModelUnit;
@interface EffectPanelCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *effectNameLabel;
@property (nonatomic, strong) UIImageView *effectThumbnailImageView;
@property (nonatomic, strong) UILabel *effectSelectedMask;
@property (nonatomic, strong) UILabel *effectDownloadMask;

- (void)setupContentView;
- (void)updateContentViewWithEffectModelUnit:(EffectPanelModelUnit *)effectModelUnit;

@end

NS_ASSUME_NONNULL_END
