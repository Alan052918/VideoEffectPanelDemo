//
//  ServerSideModelUnit.h
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServersideModelUnit : NSObject

@property (nonatomic, strong) NSString *dataId;
@property (nonatomic, strong) NSString *dataName;
@property (nonatomic, strong) NSString *dataImageUrl;
@property (nonatomic, strong) NSString *dataImageCaption;
@property (nonatomic, assign, getter=isSelected) BOOL selected;

@end

NS_ASSUME_NONNULL_END
