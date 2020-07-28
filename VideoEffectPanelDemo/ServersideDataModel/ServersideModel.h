//
//  ServerSideModel.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ServersideModelUnit;
@interface ServersideModel : NSObject

@property (nonatomic, strong) NSMutableArray <ServersideModelUnit *> *serverSideModelContent;

- (void)populateServersideModelContent;

@end

NS_ASSUME_NONNULL_END
