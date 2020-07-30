//
//  EffectPanel.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanelView.h"
#import "EffectPanelCollectionViewModel.h"
#import "ServersideModel.h"
#import "ServersideModelUnit.h"
#import "EffectPanelCollectionViewCell.h"
#import "EffectPanelCollectionViewCellModel.h"
#import "EffectDownloadManager.h"

static const CGFloat EffectPanelCollectionViewCellHeight = 70.5f;
static const CGFloat EffectPanelCollectionViewCellWidth = 60.0f;
static const CGFloat EffectPanelCollectionViewCellSpacingMin = 11.0f;
static const CGFloat EffectPanelCollectionViewCellSpacingTopBottom = 20.0f;
static const CGFloat EffectPanelCollectionViewCellSpacingLeftRight = 15.0f;

@interface EffectPanelView ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) EffectPanelCollectionViewModel *collectionViewModel;
@property (nonatomic, strong) EffectDownloadManager *downloadManager;

@end

@implementation EffectPanelView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.downloadManager = [[EffectDownloadManager alloc] init];
        
        [self setupCollectionView];
    }
    return self;
}


- (void)setupCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(EffectPanelCollectionViewCellWidth, EffectPanelCollectionViewCellHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = EffectPanelCollectionViewCellSpacingMin;
    flowLayout.minimumLineSpacing = EffectPanelCollectionViewCellSpacingTopBottom;
    flowLayout.sectionInset = UIEdgeInsetsMake(EffectPanelCollectionViewCellSpacingTopBottom, EffectPanelCollectionViewCellSpacingLeftRight, EffectPanelCollectionViewCellSpacingTopBottom, EffectPanelCollectionViewCellSpacingLeftRight);

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.allowsMultipleSelection = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:EffectPanelCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(EffectPanelCollectionViewCell.class)];
    
    [self addSubview:self.collectionView];

    self.collectionViewModel = [[EffectPanelCollectionViewModel alloc] init];
}

/**
 * Compose cellViewModels from
 */
- (void)pushUpdateWithViewModel:(ServersideModel *)model {
    for (int i = 0; i < model.serverSideModelContent.count; ++i) {
        EffectPanelCollectionViewCellModel *cellViewModel = [[EffectPanelCollectionViewCellModel alloc] init];
        ServersideModelUnit *serversideModelUnit = [model.serverSideModelContent objectAtIndex:i];
        cellViewModel.cellViewModelId = serversideModelUnit.dataId;
        cellViewModel.cellViewModelName = serversideModelUnit.dataName;
        cellViewModel.cellViewModelImageUrl = serversideModelUnit.dataImageUrl;
        cellViewModel.selected = serversideModelUnit.isSelected;
        cellViewModel.cellViewModelEffectStatus = CellViewModelEffectUncached;
        cellViewModel.cellViewModelEffect = nil;
        [self.collectionViewModel addCellViewModel:cellViewModel];
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.collectionViewModel countCellViewModels];
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EffectPanelCollectionViewCell *effectPanelCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(EffectPanelCollectionViewCell.class) forIndexPath:indexPath];
    EffectPanelCollectionViewCellModel *effectPanelCellViewModel = [self.collectionViewModel objectAtIndex:indexPath.item];
    effectPanelCell.delegate = self.downloadManager;
    Effect *effect = [effectPanelCell pushUpdateWithCollectionViewCellModel:effectPanelCellViewModel];
    [self.collectionViewModel updateCellViewModelAtIndex:indexPath.item effect:effect effectStatus:effectPanelCellViewModel.cellViewModelEffectStatus];
    return effectPanelCell;
}


#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.collectionViewModel selectCellViewModelAtIndex:indexPath.item];
    [self.collectionView reloadData];
}


@end
