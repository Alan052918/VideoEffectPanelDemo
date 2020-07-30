//
//  ServerSideModel.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "ServersideModel.h"
#import "ServersideModelUnit.h"

@interface ServersideModel ()

@end

@implementation ServersideModel

- (void)populateServersideModelContent {
    ServersideModelUnit *alice = [[ServersideModelUnit alloc] init];
    alice.dataId = @"0";
    alice.dataName = @"Alice";
    alice.dataImageUrl = @"placeholder.comalice";
    alice.dataImageCaption = @"A cool girl";
    alice.selected = NO;
    
    ServersideModelUnit *bob = [[ServersideModelUnit alloc] init];
    bob.dataId = @"1";
    bob.dataName = @"Bob";
    bob.dataImageUrl = @"placeholder.combob";
    bob.dataImageCaption = @"A cool boy";
    bob.selected = NO;
    
    ServersideModelUnit *curry = [[ServersideModelUnit alloc] init];
    curry.dataId = @"2";
    curry.dataName = @"Curry";
    curry.dataImageUrl = @"placeholder.comcurry";
    curry.dataImageCaption = @"A cool guy";
    curry.selected = NO;
    
    ServersideModelUnit *dylan = [[ServersideModelUnit alloc] init];
    dylan.dataId = @"3";
    dylan.dataName = @"Dylan";
    dylan.dataImageUrl = @"placeholder.comdylan";
    dylan.dataImageCaption = @"A cool hipster";
    dylan.selected = NO;
    
    ServersideModelUnit *emma = [[ServersideModelUnit alloc] init];
    emma.dataId = @"4";
    emma.dataName = @"Emma";
    emma.dataImageUrl = @"placeholder.comemma";
    emma.dataImageCaption = @"A cool gangster";
    emma.selected = NO;
    
    self.serverSideModelContent = [[NSMutableArray alloc] initWithObjects:alice, bob, curry, dylan, emma, nil];
}

@end
