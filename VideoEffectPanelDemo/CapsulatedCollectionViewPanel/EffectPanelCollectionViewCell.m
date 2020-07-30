//
//  EffectPanelCollectionViewCell.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanelCollectionViewCell.h"
#import "EffectPanelCollectionViewCellModel.h"
#import "Effect.h"

static const CGFloat EffectThumbnailImageHeight = 50.0f;
static const CGFloat EffectThumbnailImageWidth = 50.0f;
static const CGFloat EffectThumbnailImageMargin = 5.0f;

@interface EffectPanelCollectionViewCell ()

- (void)setupContentView;

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
    self.cellThumbnailImageView = [[UIImageView alloc] initWithFrame:ThumbnailFrame];
    self.cellThumbnailImageView.layer.cornerRadius = 6.0f;
    self.cellThumbnailImageView.layer.masksToBounds = YES;
    self.cellThumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.cellThumbnailImageView];
    
    self.cellNameLabel = [[UILabel alloc] init];
    self.cellNameLabel.font = [UIFont systemFontOfSize:11.5f];
    self.cellNameLabel.frame = CGRectMake(0.0f, self.cellThumbnailImageView.frame.size.height, self.frame.size.width, self.cellNameLabel.font.lineHeight);
    self.cellNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.cellNameLabel];
    
    self.cellSelectedMask = [[UILabel alloc] initWithFrame:ThumbnailFrame];
    self.cellSelectedMask.layer.cornerRadius = 6.0f;
    self.cellSelectedMask.layer.masksToBounds = YES;
    self.cellSelectedMask.backgroundColor = UIColor.blackColor;
    self.cellSelectedMask.alpha = 0.0f;
    self.cellSelectedMask.font = [UIFont systemFontOfSize:7.5f];
    self.cellSelectedMask.text = @"SELECTED";
    self.cellSelectedMask.textColor = UIColor.whiteColor;
    self.cellSelectedMask.textAlignment = NSTextAlignmentCenter;
    self.cellSelectedMask.userInteractionEnabled = NO;
    [self addSubview:self.cellSelectedMask];
    
    self.cellDownloadMask = [[UILabel alloc] initWithFrame:ThumbnailFrame];
    self.cellDownloadMask.layer.cornerRadius = 6.0f;
    self.cellDownloadMask.layer.masksToBounds = YES;
    self.cellDownloadMask.backgroundColor = UIColor.blueColor;
    self.cellDownloadMask.alpha = 0.0f;
    self.cellDownloadMask.adjustsFontSizeToFitWidth = YES;
    self.cellDownloadMask.textColor = UIColor.whiteColor;
    self.cellDownloadMask.userInteractionEnabled = NO;
    [self addSubview:self.cellDownloadMask];
}


/**
 * Bind Model data to View display
 */
- (Effect *)pushUpdateWithCollectionViewCellModel:(EffectPanelCollectionViewCellModel *)cellViewModel {
    self.cellId = cellViewModel.cellViewModelId;
    self.cellNameLabel.text = cellViewModel.cellViewModelName;
    self.cellThumbnailImageView.image = [UIImage imageNamed:cellViewModel.cellViewModelImageUrl];
    self.cellSelectedMask.alpha = cellViewModel.isSelected ? 0.6f : 0.0f;
    if (cellViewModel.cellViewModelEffectStatus == CellViewModelEffectDownloading) {
        NSLog(@"[%@.m] cell effect downloading", self.class);
        self.cellDownloadMask.alpha = 0.7f;
        [self.delegate bindDownloadTaskToEffectPanelCell:self];
        return [self.delegate downloadEffectForEffectPanelCell:self];
    }
    return nil;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.cellDownloadMask.text = [NSString stringWithFormat:@"%@%%", [[object valueForKeyPath:@"downloadProgressValue"] stringValue]];
    NSLog(@"[%@.m] downloading progress: [%@]", self.class, self.cellDownloadMask.text);
    if ([self.cellDownloadMask.text isEqualToString:@"100%%"]) {
        [self.delegate unbindDownloadTaskToEffectPanelCell:self];
    }
}


@end
