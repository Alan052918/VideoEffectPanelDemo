//
//  EffectPanelModel.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanelModel.h"
#import "EffectPanelModelUnit.h"
#import "EffectPanelCollectionViewCell.h"

@interface EffectPanelModel ()

@property (nonatomic, strong) NSMutableArray <EffectPanelModelUnit *> *effectUnits;

@end

@implementation EffectPanelModel


- (instancetype)init {
    self = [super init];
    if (self) {
        self.effectUnits = [[NSMutableArray alloc] init];
    }
    return self;
}


- (NSInteger)countEffectUnits {
    return self.effectUnits.count;
}


- (void)addEffectUnit:(EffectPanelModelUnit *)effectUnit {
    [self.effectUnits addObject:effectUnit];
}


- (void)populateModelWithEffectUnitArray:(nonnull NSArray <EffectPanelModelUnit *> *)effectUnitArray {
    [self.effectUnits addObjectsFromArray:effectUnitArray];
}


- (void)selectEffectUnitAtIndex:(NSInteger)index {
    [self.effectUnits objectAtIndex:index].selected = YES;
}


- (EffectPanelModelUnit *)objectAtIndex:(NSInteger)index {
    return [self.effectUnits objectAtIndex:index];
}


@end
