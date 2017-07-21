//
//  SegmentView.h
//  SegmentViewsDemo
//
//  Created by 周必稳 on 16/4/18.
//  Copyright © 2016年 demo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DoctorInfo,DoctorDetailModel;
@protocol SegmentViewDelegate <NSObject>

@optional
- (void)titleCellForItem:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

- (void)contentCellForItem:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

- (void)contentCellDidAppear:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@interface SegmentView : UIView

@property (nonatomic, strong) UICollectionView *titlesView;
@property (nonatomic, strong) UICollectionView *contentsView;

@property (nonatomic, assign) CGFloat titleHeight;
@property (nonatomic, assign) id<SegmentViewDelegate> delegate;

- (void)setupTitleArray:(NSArray *)titleArray;

- (void)setupTitleCellNib:(UINib *)cellNib;
- (void)setupTitleCell:(Class)cellClass;

- (void)setupContentCellNib:(UINib *)cellNib;
- (void)setupContentCell:(Class)cellClass;

// 内容cell不会复用
- (void)setupTitleArray:(NSArray *)titleArray contentCellNib:(UINib *)cellNib;

@end
