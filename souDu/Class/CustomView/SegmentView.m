//
//  SegmentView.m
//  SegmentViewsDemo
//
//  Created by 周必稳 on 16/4/18.
//  Copyright © 2016年 demo. All rights reserved.
//

#import "SegmentView.h"

#define titleWidth 70
#define BannerHeight 150
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface SegmentView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>
{
    CGFloat lastPointX; // 记录内容视图上一次x坐标
    NSIndexPath *lastTitleCellIndexPath;
}

@property (nonatomic, strong) UIView *titleLocationView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, assign) BOOL panSroll;
@property (nonatomic, assign) BOOL reuseEnable;
@end

@implementation SegmentView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
        [self initData];
    }
    return self;
}

- (void)initSubViews {
    [self layoutTitlesView];
    [self layoutContentView];
    [self layoutTitleLocationView];
}

- (void)initData {
    _reuseEnable = YES;
    lastTitleCellIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
}

- (void)layoutTitlesView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0.001;
    layout.minimumInteritemSpacing = 0.001;
    self.titleHeight = 40;
    self.titlesView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth , self.titleHeight) collectionViewLayout:layout];
    self.titlesView.bounces = NO;
    self.titlesView.backgroundColor =[UIColor whiteColor];//[UIColor colorWithRed:43 / 255.0 green:98 / 255.0 blue:233 / 255.0 alpha:1];
    self.titlesView.showsHorizontalScrollIndicator = NO;
    self.titlesView.delegate = self;
    self.titlesView.dataSource = self;
    [self addSubview:self.titlesView];
    [self.titlesView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)layoutContentView {
    CGFloat height = self.bounds.size.height - CGRectGetMaxY(self.titlesView.frame);
    UICollectionViewFlowLayout *layout1 = [[UICollectionViewFlowLayout alloc]init];
    layout1.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout1.minimumLineSpacing = 0.01;
    CGRect contentsViewFrame = CGRectMake(0, CGRectGetMaxY(self.titlesView.frame), kScreenWidth, height);
    self.contentsView = [[UICollectionView alloc]initWithFrame:contentsViewFrame collectionViewLayout:layout1];
    self.contentsView.backgroundColor =  [UIColor clearColor];//UIColorFromRGB(0xE9ECF2);
    self.contentsView.pagingEnabled = YES;
    self.contentsView.showsHorizontalScrollIndicator = NO;
    self.contentsView.delegate = self;
    self.contentsView.dataSource = self;
    [self addSubview:self.contentsView];
    
    [self.contentsView.panGestureRecognizer addTarget:self action:@selector(bbc)];
    
    [self.contentsView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"contentCell"];
}

- (void)layoutTitleLocationView {
    self.titleLocationView = [[UIView alloc]initWithFrame:CGRectMake(0, self.titleHeight - 2, titleWidth, 2)];
    self.titleLocationView.backgroundColor = [UIColor clearColor];
    [self.titlesView addSubview:self.titleLocationView];
}

#pragma mark - Actions
- (void)setupTitleArray:(NSArray *)titleArray {
    self.titlesArray = titleArray;
    [self.titlesView reloadData];
    [self.titlesView selectItemAtIndexPath:lastTitleCellIndexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

- (void)setupTitleCellNib:(UINib *)cellNib {
    [self.titlesView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
}

- (void)setupTitleCell:(Class)cellClass {
    [self.titlesView registerClass:cellClass forCellWithReuseIdentifier:@"cell"];
}

- (void)setupContentCellNib:(UINib *)cellNib {
    NSString *reuseIdentifier = [NSString stringWithFormat:@"contentCell"];
    [self.contentsView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)setupContentCell:(Class)cellClass {
    [self.contentsView registerClass:cellClass forCellWithReuseIdentifier:@"contentCell"];
}

- (void)setupTitleArray:(NSArray *)titleArray contentCellNib:(UINib *)cellNib {
    _reuseEnable = NO;
    [self setupTitleArray:titleArray];
    for (int i = 0; i < self.titlesArray.count; i++) {
        NSString *reuseIdentifier = [NSString stringWithFormat:@"contentCell%d",i];
        [self.contentsView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
    }
}

- (BOOL)titleCanFillScreen {
    CGFloat width = 0;
    for (int i = 0; i < self.titlesArray.count; i++) {
        CGSize size = [self.titlesArray[i] sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]}];
        size.width += 22;
        width += size.width;
    }
    return width > kScreenWidth;
}

#pragma mark - segmentedControlAction
- (void)segmentedControlAction:(UISegmentedControl *)segmentedControl {}

- (void)changeFont:(UICollectionView *)collectionView indexpath:(NSIndexPath *)indexPath {
    _panSroll = NO;
    lastTitleCellIndexPath = indexPath;
    [self.contentsView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if ([self.delegate respondsToSelector:@selector(contentCellDidAppear:atIndexPath:)]) {
        [self.delegate contentCellDidAppear:[self.contentsView cellForItemAtIndexPath:indexPath] atIndexPath:indexPath];
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView isEqual:self.titlesView]) {
        if ([self titleCanFillScreen]) {
            CGSize size = [self.titlesArray[indexPath.item] sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]}];
            size.width += 22;
            return CGSizeMake(size.width, self.titleHeight);
        }else {
            return CGSizeMake(kScreenWidth / self.titlesArray.count, self.titleHeight);
        }
    }else {
        CGFloat height = self.bounds.size.height - CGRectGetMaxY(self.titlesView.frame);
        return CGSizeMake(kScreenWidth, height);
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView isEqual:self.titlesView]) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        if ([self.delegate respondsToSelector:@selector(titleCellForItem:atIndexPath:)]) {
            [self.delegate titleCellForItem:cell atIndexPath:indexPath];
        }
        return cell;
    }else {
        NSString *reuseIdentifier = _reuseEnable ? @"contentCell" : [NSString stringWithFormat:@"contentCell%ld",indexPath.row];
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        if ([self.delegate respondsToSelector:@selector(contentCellForItem:atIndexPath:)]) {
            [self.delegate contentCellForItem:cell atIndexPath:indexPath];
        }
        return cell;
    }
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView isEqual:self.titlesView]) {
        if (![lastTitleCellIndexPath isEqual:indexPath]) {
            [self changeFont:self.titlesView indexpath:indexPath];
        }
    }else {
        NSLog(@"contentView");
    }
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.contentsView]) {
        if (_panSroll) {
            CGPoint contentoffset = self.contentsView.contentOffset;
            NSInteger index = (contentoffset.x + kScreenWidth / 2) / kScreenWidth;
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
            if (![indexPath isEqual:lastTitleCellIndexPath]) {
                [self.titlesView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                lastTitleCellIndexPath = indexPath;
            }
        }

        CGFloat contentM = self.contentsView.contentOffset.x; // 内容视图当前x坐标
        CGFloat margin = contentM - lastPointX; // 内容视图的偏移量
        CGRect frame = self.titleLocationView.frame; // 标签下面的横线
        frame.origin.x += margin * self.titlesView.contentSize.width / self.contentsView.contentSize.width;
        if (frame.origin.x < 0) {
            return;
        }
        if ((int)(frame.origin.x + titleWidth - self.titlesView.contentSize.width) > 0) {
        }else {
            lastPointX = contentM;
            self.titleLocationView.frame = frame;
            CGFloat titlesM = self.titlesView.contentOffset.x;
            if (frame.origin.x - titlesM > kScreenWidth - titleWidth) {
                CGFloat result = frame.origin.x - titlesM + titleWidth - kScreenWidth;
                self.titlesView.contentOffset = CGPointMake(result + titlesM, 0);
            }
            if (frame.origin.x < titlesM && titlesM != 0) {
                self.titlesView.contentOffset = CGPointMake(frame.origin.x, 0);
            }
        }
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.titlesView]) {
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    if ([scrollView isEqual:self.titlesView]) {
        
    }else {
        CGPoint contentoffset = self.contentsView.contentOffset;
        NSInteger index = contentoffset.x / kScreenWidth;
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
            if ([self.delegate respondsToSelector:@selector(contentCellDidAppear:atIndexPath:)]) {
                [self.delegate contentCellDidAppear:[self.contentsView cellForItemAtIndexPath:indexPath] atIndexPath:indexPath];
            }
    }
}

#pragma mark - GestureActions
- (void)bbc {
    _panSroll = YES;
}


@end
