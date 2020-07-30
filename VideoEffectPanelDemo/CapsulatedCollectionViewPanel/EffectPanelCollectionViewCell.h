//
//  EffectPanelCollectionViewCell.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelCollectionViewCell, EffectDownloadTask, Effect;
@protocol EffectPanelCollectionViewCellDelegate <NSObject>

- (void)bindDownloadTaskToEffectPanelCell:(EffectPanelCollectionViewCell *)cell;
- (void)unbindDownloadTaskToEffectPanelCell:(EffectPanelCollectionViewCell *)cell;
- (Effect *)downloadEffectForEffectPanelCell:(EffectPanelCollectionViewCell *)cell;

@end

@class EffectPanelCollectionViewCellModel;
@interface EffectPanelCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *cellId;
@property (nonatomic, strong) UILabel *cellNameLabel;
@property (nonatomic, strong) UIImageView *cellThumbnailImageView;
@property (nonatomic, strong) UILabel *cellSelectedMask;
@property (nonatomic, strong) UILabel *cellDownloadMask;
@property (nonatomic, strong) id <EffectPanelCollectionViewCellDelegate> delegate;

- (Effect *)pushUpdateWithCollectionViewCellModel:(EffectPanelCollectionViewCellModel *)cellViewModel;

@end

NS_ASSUME_NONNULL_END
