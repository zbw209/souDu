//
//  HomeTableHeaderView.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "HomeTableHeaderView.h"
#import "SDCycleScrollView.h"
#import "HomeHeaderCollectionCell.h"

@interface HomeTableHeaderView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, copy) void(^imageClickedBlock)(NSInteger index);
@property (weak, nonatomic) IBOutlet UIView *cycleBackgroundView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *collectionShadowBgView;

@property (nonatomic, strong) NSArray *sourceArray;
@property (nonatomic, strong) NSArray *detailArray;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation HomeTableHeaderView

+ (instancetype)loadHeaderView {
   return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupData];
    [self setupSubViews];
}

- (void)setupData {
    _sourceArray = @[@"消费贷款",@"购车贷款",@"购房贷款",@"企业贷款"];
    _detailArray = @[@"个人消费",@"购买汽车",@"购买房子",@"企业消费"];
    _imageArray = @[@"01-icon-Personal",@"01-icon-car",@"01-icon-house",@"01-icon-company"];
}

- (void)setupSubViews {
    [self setupCollectionView];
    [self setupCollectionShadowView];
}

- (void)setupCollectionView {
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeHeaderCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"HomeHeaderCollectionCell"];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake((kScreenW  - 24 )/ 2 - 0.005, 70 - 0.005);
    flowLayout.minimumLineSpacing = 0.01;
    flowLayout.minimumInteritemSpacing = 0.01;
}

- (void)setupCollectionShadowView {
    self.collectionShadowBgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.collectionShadowBgView.layer.shadowOffset = CGSizeMake(0, 6);
    self.collectionShadowBgView.layer.shadowOpacity = 0.08;

    //
}

- (void)clickImage:(void(^)(NSInteger index))imageAction {
    self.imageClickedBlock = imageAction;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _sourceArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeHeaderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeHeaderCollectionCell" forIndexPath:indexPath];
    cell.testLabel.text = _sourceArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    cell.detailLabel.text = _detailArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(itemDidSelectAtIndexPath:)]) {
        [self.delegate itemDidSelectAtIndexPath:indexPath];
    }
}

@end
