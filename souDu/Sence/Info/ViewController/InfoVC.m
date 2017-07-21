//
//  InfoVC.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "InfoVC.h"
#import "SegmentView.h"
#import "InfoTitleCell.h"
#import "InfoContentCell.h"

@interface InfoVC ()<SegmentViewDelegate>

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation InfoVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageWithColor:[UIColor whiteColor]];
    [self setNavigationBarBackgroundImage:image ShadowImage:image];
}

- (void)setupData {
    self.titleArray = @[@"热门",@"消费贷款",@"购车贷款",@"购房贷款",@"企业贷款"];
}

- (void)setupSubViews {
    [self setupSearchBar];
    [self setupSegmentView];
}

- (void)setupSearchBar {
    UIView *searchBarBgView = [[UIView alloc]initWithFrame:CGRectMake(17, 0, kScreenW - 34, 32)];
    searchBarBgView.backgroundColor = kUIColorFromRGB(0xe5e9ed);
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenW - 34, 32)];
    searchBar.placeholder = @"请输入关键词";
    [searchBar setTextFieldBackgroundColor:[UIColor clearColor]];
    [searchBarBgView makeCornerRadius:16];
    [searchBarBgView addSubview:searchBar];
    self.navigationItem.titleView = searchBarBgView;
}

- (void)setupSegmentView {
    SegmentView *segV = [[SegmentView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64 - 49)];
    [segV setupTitleCellNib:kNib(@"InfoTitleCell")];
    [segV setupContentCellNib:kNib(@"InfoContentCell")];
//    segV.titlesView.backgroundColor = kUIColorFromRGB(0x2B62E9);
    [segV setupTitleArray:self.titleArray];
    segV.delegate = self;
    [self.view addSubview:segV];
}

#pragma mark - SegmentViewDelegate
- (void)titleCellForItem:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    InfoTitleCell *infoCell = (InfoTitleCell *)cell;
    infoCell.titleLabel.text = self.titleArray[indexPath.item];
}

- (void)contentCellForItem:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    InfoContentCell *infoCell = (InfoContentCell *)cell;
    [infoCell setTableHeaderImageViewHidden:indexPath.row];
}


@end
