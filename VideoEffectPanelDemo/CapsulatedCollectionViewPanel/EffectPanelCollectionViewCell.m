//
//  EffectPanelCollectionViewCell.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanelCollectionViewCell.h"
#import "EffectPanelModelUnit.h"

static const CGFloat EffectThumbnailImageHeight = 50.0f;
static const CGFloat EffectThumbnailImageWidth = 50.0f;
static const CGFloat EffectThumbnailImageMargin = 5.0f;

@interface EffectPanelCollectionViewCell ()

@end

@implementation EffectPanelCollectionViewCell

/**
 * Called by dequeueReusableCellWithReuseIdentifier:
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentView];
    }
    return self;
}


/**
 * Compose effect thumbnail image, name label, and selected mask
 */
- (void)setupContentView {
    CGRect ThumbnailFrame = CGRectMake(EffectThumbnailImageMargin, 0.0f, EffectThumbnailImageWidth, EffectThumbnailImageHeight);
    self.effectThumbnailImageView = [[UIImageView alloc] initWithFrame:ThumbnailFrame];
    self.effectThumbnailImageView.layer.cornerRadius = 6.0f;
    self.effectThumbnailImageView.layer.masksToBounds = YES;
    self.effectThumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.effectThumbnailImageView];
    
    self.effectNameLabel = [[UILabel alloc] init];
    self.effectNameLabel.font = [UIFont systemFontOfSize:11.5f];
    self.effectNameLabel.frame = CGRectMake(0.0f, self.effectThumbnailImageView.frame.size.height, self.frame.size.width, self.effectNameLabel.font.lineHeight);
    self.effectNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.effectNameLabel];
    
    self.effectSelectedMask = [[UILabel alloc] initWithFrame:ThumbnailFrame];
    self.effectSelectedMask.layer.cornerRadius = 6.0f;
    self.effectSelectedMask.layer.masksToBounds = YES;
    self.effectSelectedMask.backgroundColor = UIColor.blackColor;
    self.effectSelectedMask.alpha = 0.0f;
    self.effectSelectedMask.font = [UIFont systemFontOfSize:7.5f];
    self.effectSelectedMask.text = @"SELECTED";
    self.effectSelectedMask.textColor = UIColor.whiteColor;
    self.effectSelectedMask.textAlignment = NSTextAlignmentCenter;
    self.effectSelectedMask.userInteractionEnabled = NO;
    [self addSubview:self.effectSelectedMask];
    
    self.effectDownloadMask = [[UILabel alloc] initWithFrame:ThumbnailFrame];
    self.effectDownloadMask.layer.cornerRadius = 6.0f;
    self.effectDownloadMask.layer.masksToBounds = YES;
    self.effectDownloadMask.backgroundColor = UIColor.blueColor;
    self.effectDownloadMask.alpha = 0.0f;
    self.effectDownloadMask.adjustsFontSizeToFitWidth = YES;
    self.effectDownloadMask.textColor = UIColor.whiteColor;
    self.effectDownloadMask.userInteractionEnabled = NO;
    [self addSubview:self.effectDownloadMask];
}


/**
 * Bind Model data to View display
 */
- (void)updateContentViewWithEffectModelUnit:(EffectPanelModelUnit *)effectModelUnit {
    self.effectNameLabel.text = effectModelUnit.effectUnitName;
    self.effectThumbnailImageView.image = [UIImage imageNamed:effectModelUnit.effectUnitImageUrl];
    self.effectSelectedMask.alpha = effectModelUnit.isSelected ? 0.6f : 0.0f;
}





@end
