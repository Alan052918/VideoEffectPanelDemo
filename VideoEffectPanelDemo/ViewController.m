//
//  ViewController.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "ViewController.h"
#import "ServersideModel.h"
#import "ServersideModelUnit.h"

/// Required for wiring in the panel
#import "EffectPanelView.h"
#import "EffectPanelCollectionViewModel.h"
#import "EffectPanelCollectionViewCellModel.h"

@interface ViewController ()

@property (nonatomic, strong) EffectPanelView *effectPanel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    ServersideModel *serversideModel = [[ServersideModel alloc] init];
    [serversideModel populateServersideModelContent];
    
    self.effectPanel = [[EffectPanelView alloc] initWithFrame:self.view.frame];
    [self.effectPanel pushUpdateWithViewModel:serversideModel];
    [self.view addSubview:self.effectPanel];

    self.navigationItem.title = @"Navigation Bar";
    self.navigationController.toolbarHidden = NO;
}


@end
