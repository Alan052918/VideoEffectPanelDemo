//
//  EffectPanelCollectionViewCell.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanelCollectionViewCell.h"

static const CGFloat EffectThumbnailImageHeight = 50.0f;
static const CGFloat EffectThumbnailImageWidth = 50.0f;
static const CGFloat EffectThumbnailImageMargin = 5.0f;

@interface EffectPanelCollectionViewCell ()

- (void)setupContentView;

@end

@implementation EffectPanelCollectionViewCell


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupContentView];
    }
    return self;
}


- (void)setupContentView {
    self.effectThumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectMake(EffectThumbnailImageMargin, 0, EffectThumbnailImageWidth, EffectThumbnailImageHeight)];
    self.effectThumbnailImageView.layer.cornerRadius = 6;
    self.effectThumbnailImageView.layer.masksToBounds = YES;
    self.effectThumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.effectThumbnailImageView];
    
    self.effectNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.effectThumbnailImageView.frame.size.height + 10, self.frame.size.width, self.effectNameLabel.font.lineHeight)];
    self.effectNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.effectNameLabel];
    
    self.effectSelectedMask = [[UITextView alloc] initWithFrame:CGRectMake(EffectThumbnailImageMargin, 0, EffectThumbnailImageWidth, EffectThumbnailImageHeight)];
    self.effectSelectedMask.layer.cornerRadius = 6;
    self.effectSelectedMask.layer.masksToBounds = YES;
    self.effectSelectedMask.contentMode = UIViewContentModeScaleAspectFill;
}


@end
