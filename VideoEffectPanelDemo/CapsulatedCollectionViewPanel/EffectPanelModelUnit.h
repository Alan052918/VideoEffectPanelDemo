//
//  EffectPanelModelUnit.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Effect;
/// Template data model unit panel users need to compose
@interface EffectPanelModelUnit : NSObject

@property (nonatomic, strong) NSString *effectUnitId;
@property (nonatomic, strong) NSString *effectUnitName;
@property (nonatomic, strong) NSString *effectUnitImageUrl;
@property (nonatomic, assign, getter=isSelected) BOOL selected;
@property (nonatomic, strong, nullable) Effect *effectUnitEffect;

@end

NS_ASSUME_NONNULL_END
