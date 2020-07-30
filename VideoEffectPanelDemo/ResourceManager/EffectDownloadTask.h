//
//  EffectDownloadTask.h
//  VideoEffectPanelDemo
//
//  Created by Alan on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Effect;
@interface EffectDownloadTask : NSObject

@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, assign) NSInteger downloadProgressValue;

- (Effect *)downloadEffect;

@end

NS_ASSUME_NONNULL_END
