//
//  EffectPanelModel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class EffectPanelModelUnit;
/// Collection view data source
@interface EffectPanelModel : NSObject

- (NSInteger)countEffectUnits;
- (void)addEffectUnit:(EffectPanelModelUnit *)effectUnit;
- (void)populateModelWithEffectUnitArray:(nonnull NSArray <EffectPanelModelUnit *> *)effectUnitArray;
- (void)selectEffectUnitAtIndex:(NSInteger)index;
- (EffectPanelModelUnit *)objectAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
