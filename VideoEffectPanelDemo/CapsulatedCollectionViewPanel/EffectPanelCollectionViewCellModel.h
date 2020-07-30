//
//  EffectPanelCollectionViewCellModel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EffectDownloadManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CellViewModelEffectStatus) {
    CellViewModelEffectUncached,
    CellViewModelEffectDownloading,
    CellViewModelEffectCached,
};

@class Effect;
@interface EffectPanelCollectionViewCellModel : NSObject

@property (nonatomic, strong) NSString *cellViewModelId;
@property (nonatomic, strong) NSString *cellViewModelName;
@property (nonatomic, strong) NSString *cellViewModelImageUrl;
@property (nonatomic, assign) NSInteger cellViewModelEffectStatus;
@property (nonatomic, strong, nullable) Effect *cellViewModelEffect;
@property (nonatomic, assign, getter=isSelected) BOOL selected;

@end

NS_ASSUME_NONNULL_END
