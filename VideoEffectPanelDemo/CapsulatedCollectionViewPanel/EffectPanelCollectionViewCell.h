//
//  EffectPanelCollectionViewCell.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EffectPanelCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *effectNameLabel;
@property (nonatomic, strong) UIImageView *effectThumbnailImageView;
@property (nonatomic, strong) UITextView *effectSelectedMask;

@end

NS_ASSUME_NONNULL_END
