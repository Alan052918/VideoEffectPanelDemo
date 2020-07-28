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
    alice.imageName = @"Alice";
    alice.imageUrl = @"placeholder.comalice";
    alice.imageCaption = @"A cool girl";
    alice.selected = NO;
    
    ServersideModelUnit *bob = [[ServersideModelUnit alloc] init];
    bob.imageName = @"Bob";
    bob.imageUrl = @"placeholder.combob";
    bob.imageCaption = @"A cool boy";
    bob.selected = NO;
    
    ServersideModelUnit *curry = [[ServersideModelUnit alloc] init];
    curry.imageName = @"Curry";
    curry.imageUrl = @"placeholder.comcurry";
    curry.imageCaption = @"A cool guy";
    curry.selected = NO;
    
    ServersideModelUnit *dylan = [[ServersideModelUnit alloc] init];
    dylan.imageName = @"Dylan";
    dylan.imageUrl = @"placeholder.comdylan";
    dylan.imageCaption = @"A cool hipster";
    dylan.selected = NO;
    
    ServersideModelUnit *emma = [[ServersideModelUnit alloc] init];
    emma.imageName = @"Emma";
    emma.imageUrl = @"placeholder.comemma";
    emma.imageCaption = @"A cool gangster";
    emma.selected = NO;
    
    self.serverSideModelContent = [[NSMutableArray alloc] initWithObjects:alice, bob, curry, dylan, emma, nil];
}

@end
