//
//  EffectPanelCollectionViewCell.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelCollectionViewCellModel, Effect;
@interface EffectPanelCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *cellId;
@property (nonatomic, strong) UILabel *cellNameLabel;
@property (nonatomic, strong) UIImageView *cellThumbnailImageView;
@property (nonatomic, strong) UILabel *cellSelectedMask;
@property (nonatomic, strong) UILabel *cellDownloadMask;

- (void)pushUpdateWithCollectionViewCellModel:(EffectPanelCollectionViewCellModel *)cellViewModel onCompletion:(void (^)(void))afterWork ;

@end

NS_ASSUME_NONNULL_END
