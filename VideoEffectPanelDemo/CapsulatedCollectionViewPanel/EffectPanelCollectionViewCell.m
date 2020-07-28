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


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
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
    
    self.effectNameLabel = [[UILabel alloc] init];
    self.effectNameLabel.frame = CGRectMake(0, self.effectThumbnailImageView.frame.size.height, self.frame.size.width, self.effectNameLabel.font.lineHeight);
    self.effectNameLabel.textAlignment = NSTextAlignmentCenter;
    self.effectNameLabel.text = @"Name";
    [self addSubview:self.effectNameLabel];
    
    self.effectSelectedMask = [[UITextView alloc] initWithFrame:CGRectMake(EffectThumbnailImageMargin, 0, EffectThumbnailImageWidth, EffectThumbnailImageHeight)];
    self.effectSelectedMask.layer.cornerRadius = 6;
    self.effectSelectedMask.layer.masksToBounds = YES;
    self.effectSelectedMask.contentMode = UIViewContentModeScaleAspectFill;
    self.effectSelectedMask.backgroundColor = [UIColor clearColor];
    self.effectSelectedMask.text = @"SELECTED!";
}


- (void)updateContentViewWithEffectModelUnit:(EffectPanelModelUnit *)effectModelUnit {
    self.effectNameLabel.text = effectModelUnit.cellName;
    self.effectThumbnailImageView.image = [UIImage imageNamed:effectModelUnit.cellImageUrl];
    if (effectModelUnit.isSelected) {
        [self addSubview:self.effectSelectedMask];
    }
}


@end
