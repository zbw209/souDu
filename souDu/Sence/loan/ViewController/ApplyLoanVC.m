//
//  ApplyLoanVC.m
//  souDu
//
//  Created by 多多 on 2017/7/11.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "ApplyLoanVC.h"
#import "ApplyLoanTableSectionModel.h"
#import "ApplyLoanTableHeaderView.h"

@interface ApplyLoanVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, strong) NSArray *rowCountArr;

@property (nonatomic, strong) NSMutableArray *visualRowCountArr;
//@property (nonatomic, strong) NSMutableArray *sectionHeaderArr;

@property (nonatomic, strong) NSMutableArray *sourceArr;

@end

@implementation ApplyLoanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];

}

#pragma mark - ButtonActions
- (IBAction)applyButtonPressed:(id)sender {
    [self showViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"WritePersonalInfoVC"] sender:nil];
}

- (void)tableSectionHeaderPressed:(UIButton *)button {
    NSInteger section = button.tag - 2000;
    ApplyLoanTableSectionModel *model = _sourceArr[section];
    
    model.expand = !model.expand;
    if (model.expand) {
        [self.tableView insertRowsAtIndexPaths:[self indexPathsInSection:section rowCount:model.subNodeCount] withRowAnimation:UITableViewRowAnimationNone];
        
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:model.subNodeCount - 1 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }else {
        [self.tableView deleteRowsAtIndexPaths:[self indexPathsInSection:section rowCount:model.subNodeCount] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

#pragma mark - Actions
- (void)setupData {
    self.title = @"贷款详情";
    _rowHeight = 60;
    _rowCountArr = @[@"3",@"5",@"2",@"4",@"3"];
    
    _sourceArr = [NSMutableArray new];
    for (NSString *rowCount in _rowCountArr) {
        ApplyLoanTableSectionModel *model = [ApplyLoanTableSectionModel sectionModel:NO subNodeCount:rowCount.integerValue];
        [_sourceArr addObject:model];
    }
}

- (NSArray *)indexPathsInSection:(NSInteger)section rowCount:(NSInteger)rowCount {
    NSMutableArray *arr =[NSMutableArray new];
    for (int i = 0; i < rowCount; i++) {
        [arr addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    return arr;
}

- (void)setupSubViews {
    [self setupTableView];
}

- (void)setupTableView {
    ApplyLoanTableHeaderView *headerView = [ApplyLoanTableHeaderView loadHeaderView];
    headerView.frame = CGRectMake(0, 0, kScreenW, [headerView viewHeight]);
        UIView *view = [[UIView alloc]initWithFrame:headerView.frame];
    [view addSubview:headerView];
    self.tableView.tableHeaderView = view;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ApplyLoanTableSectionModel *model = _sourceArr[section];
    return model.expand ? model.subNodeCount : 0;
}
 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = kUIFont(15);

    [btn addTarget:self action:@selector(tableSectionHeaderPressed:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, kScreenW, 30);
//    btn.backgroundColor = kARCColor;
    btn.tag = 2000 + section;
    
    UILabel *label = [UILabel new];
    label.text = @"如何了解我的申请进度？";
    label.font = kUIFont(15);
    [label sizeToFit];
    label.frame = CGRectMake(37, 15 - label.height / 2, label.width, label.height);

//    [btn setImage:[UIImage imageNamed:@"sousuo"] forState:UIControlStateNormal];
//    [btn setTitle:@"如何了解我的申请进度？" forState:UIControlStateNormal];
    [btn addSubview:label];
    return btn;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

@end
