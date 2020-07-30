//
//  EffectPanelCollectionViewCellModel.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/29.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanelCollectionViewCellModel.h"

@implementation EffectPanelCollectionViewCellModel

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    self.effectDownloadProgressValue = [object valueForKeyPath:@"downloadProgressValue"];
}

@end
