//
//  EffectPanel.m
//  VideoEffectPanelDemo
//
//  Created by Alan Ai on 2020/7/28.
//  Copyright © 2020 Alan Ai. All rights reserved.
//

#import "EffectPanel.h"
#import "EffectPanelModel.h"
#import "EffectPanelCollectionViewCell.h"

static const CGFloat EffectCellHeight = 70.5f;
static const CGFloat EffectCellWidth = 60.0f;
static const CGFloat EffectCellSpacing = 11.0f;
static const CGFloat EffectCellLineSpacing = 20.0f;

@interface EffectPanel ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation EffectPanel


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(EffectCellWidth, EffectCellHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumInteritemSpacing = EffectCellSpacing;
        flowLayout.minimumLineSpacing = EffectCellLineSpacing;
        flowLayout.sectionInset = UIEdgeInsetsMake(EffectCellLineSpacing, 15, EffectCellLineSpacing, 15);

        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionViewCellClass = EffectPanelCollectionViewCell.class;
        [self.collectionView registerClass:self.collectionViewCellClass forCellWithReuseIdentifier:NSStringFromClass(self.collectionViewCellClass)];
        
        [self addSubview:self.collectionView];
        self.backgroundColor = [UIColor whiteColor];
        
        self.panelModel = [[EffectPanelModel alloc] init];
    }
    return self;
}


- (void)reloadCollectionView {
    [self.collectionView reloadData];
}


- (void)registerCellClass:(Class)cellClass {
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.panelModel countEffectUnits];
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EffectPanelCollectionViewCell *effectPanelCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.collectionViewCellClass) forIndexPath:indexPath];
    EffectPanelModelUnit *effectModelUnit = [self.panelModel objectAtIndex:indexPath.item];
    [effectPanelCell updateContentViewWithEffectModelUnit:effectModelUnit];
    effectPanelCell.backgroundColor = [UIColor greenColor];
    return effectPanelCell;
}


#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.panelModel selectEffectUnitAtIndex:indexPath.item];
    [self.collectionView reloadData];
}


@end
