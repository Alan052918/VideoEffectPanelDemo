//
//  EffectDownloadManager.h
//  VideoEffectPanelDemo
//
//  Created by Alan on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelCollectionViewCell;
@interface EffectDownloadManager : NSObject

- (void)addDownloadTaskForCell:(EffectPanelCollectionViewCell *)cell;

@end

NS_ASSUME_NONNULL_END
