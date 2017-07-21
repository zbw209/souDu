//
//  HomeTableViewCell.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeHotInfoCollectionCell.h"

@interface HomeTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeHotInfoCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    
    flowLayout.itemSize = CGSizeMake(kScreenW, 94);
    flowLayout.minimumLineSpacing = 0.01;
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)moreButtonPressed:(id)sender {
    if ([self.delegate respondsToSelector:@selector(moreButtonPressed:)]) {
        [self.delegate moreButtonPressed:self];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(homeTableViewCellItemDidSelectAtIndexPath:)]) {
        [self.delegate homeTableViewCellItemDidSelectAtIndexPath:indexPath];
    }
    //
}

@end
