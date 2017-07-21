//
//  LoanVC.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "LoanVC.h"
#import "LoanCell.h"
#import "SegmentView.h"
#import "InfoTitleCell.h"
#import "LoanContentCell.h"

@interface LoanVC ()<SegmentViewDelegate,LoanContentCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation LoanVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupData {
    self.title = @"贷款超市";
    self.titleArray = @[@"消费贷款",@"购车贷款",@"购房贷款",@"企业贷款"];
}

- (void)setupSubViews {
    [((BaseNavigationVC *)self.navigationController) setNavigationBarColor: [UIColor whiteColor]];
    
    [self setupSegmentView];
}

- (void)setupSegmentView {
    
    SegmentView *segView = [[SegmentView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 24 - 49)];
    [segView setupTitleArray:self.titleArray contentCellNib:kNib(@"LoanContentCell")];
    [segView setupTitleCellNib:kNib(@"InfoTitleCell")];
    segView.delegate = self;
    [self.view addSubview:segView];
}

#pragma mark - SegmentViewDelegate
- (void)titleCellForItem:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    InfoTitleCell *infoCell = (InfoTitleCell *)cell;
    infoCell.titleLabel.text = self.titleArray[indexPath.item];
}

- (void)contentCellForItem:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    LoanContentCell *loanContentCell = (LoanContentCell *)cell;

    loanContentCell.delegate = self;
}

- (void)contentCellDidAppear:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%s %d indexPath = %@",__FUNCTION__,__LINE__,indexPath);
}

#pragma mark - LoanContentCellDelegate
- (void)loanContentCellDidSelect:(LoanContentCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [self showViewController:kVCFromStoryboard(self.storyboard, @"ApplyLoanVC") sender:nil];
}






@end
