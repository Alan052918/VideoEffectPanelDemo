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
#import "EffectPanel.h"
#import "EffectPanelModel.h"
#import "EffectPanelModelUnit.h"

@interface ViewController ()

@property (nonatomic, strong) EffectPanel *effectPanel;

- (NSArray <EffectPanelModelUnit *> *)effectModelArrayFromServersideModel:(ServersideModel *)serversideModel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.effectPanel = [[EffectPanel alloc] initWithFrame:self.view.bounds];

    ServersideModel *serversideModel = [[ServersideModel alloc] init];
    [serversideModel populateServersideModelContent];
    [self.effectPanel.panelModel populateModelWithEffectUnitArray:[self effectModelArrayFromServersideModel:serversideModel]];
//    [self.effectPanel reloadCollectionView];
    
    [self.view addSubview:self.effectPanel];

    self.navigationItem.title = @"Navigation Bar";
    self.navigationController.toolbarHidden = NO;
}


- (NSArray <EffectPanelModelUnit *> *)effectModelArrayFromServersideModel:(ServersideModel *)serversideModel {
    NSMutableArray *effectModelArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < serversideModel.serverSideModelContent.count; ++i) {
        EffectPanelModelUnit *effectPanelModelUnit = [[EffectPanelModelUnit alloc] init];
        ServersideModelUnit *serversideModelUnit = [serversideModel.serverSideModelContent objectAtIndex:i];
        effectPanelModelUnit.effectUnitId = [NSString stringWithFormat:@"epcell%d", i];
        effectPanelModelUnit.effectUnitName = serversideModelUnit.imageName;
        effectPanelModelUnit.effectUnitImageUrl = serversideModelUnit.imageUrl;
        effectPanelModelUnit.selected = NO;
        
        [effectModelArray addObject:effectPanelModelUnit];
    }
    return effectModelArray;
}


@end
