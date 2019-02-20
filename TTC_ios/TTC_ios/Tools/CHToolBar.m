//
//  CHToolBar.m
//  PUH
//
//  Created by syhdMacMini4 on 2019/1/14.
//  Copyright © 2019年 syhd. All rights reserved.
//

#import "CHToolBar.h"
#import "CHToolCollectionViewCell.h"
@implementation CHToolBar{
    UICollectionView* _collectionView;
    UICollectionViewFlowLayout* _customLayout;
    NSArray* datas;
}
static NSString *const cellId = @"cellId";
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        _customLayout = [[UICollectionViewFlowLayout alloc] init];
        _customLayout.minimumInteritemSpacing = 0;
        _customLayout.minimumLineSpacing = 0;
        _customLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:_customLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView setDelegate:(id<UICollectionViewDelegate>)self];
        [_collectionView setDataSource:(id<UICollectionViewDataSource>)self];
        [self addSubview:_collectionView];
        [_collectionView registerClass:[CHToolCollectionViewCell class] forCellWithReuseIdentifier:cellId];
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return self;
}
#pragma mark ---- UICollectionViewDataSource
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate tap:indexPath.row];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return datas.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CHToolCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell loadModel:datas[indexPath.row]];
    return cell;
    
}
#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){_collectionView.frame.size.width/datas.count,_collectionView.frame.size.height};
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)loadModel:(NSArray*)models{
    datas = models;
    [_collectionView reloadData];
}
@end
