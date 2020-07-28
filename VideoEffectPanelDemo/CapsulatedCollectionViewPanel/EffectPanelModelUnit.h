//
//  EffectPanelModelUnit.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// Template data model unit panel users need to compose
@interface EffectPanelModelUnit : NSObject

@property (nonatomic, strong) NSString *cellId;
@property (nonatomic, strong) NSString *cellName;
@property (nonatomic, strong) NSString *cellImageUrl;
@property (nonatomic, assign, getter=isSelected) BOOL selected;

@end

NS_ASSUME_NONNULL_END
