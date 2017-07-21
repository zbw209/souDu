//
//  HomeVC.m
//  souDu
//
//  Created by 多多 on 2017/7/11.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "HomeVC.h"
#import "HomeTableHeaderView.h"
#import "HomeTableViewCell.h"
#import "HomeTableFooterView.h"

@interface HomeVC ()<UITableViewDelegate,UITableViewDataSource,HomeTableHeaderViewDelegate,HomeTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewTopLayout;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)setupTableView {
    CGRect frame = CGRectMake(0, 0, kScreenW, 199 * kScreenWScale + 12 + 140 - 17);
    UIView *view = [[UIView alloc]initWithFrame:frame];
    HomeTableHeaderView *headerV = [HomeTableHeaderView loadHeaderView];
    headerV.delegate = self;
    headerV.frame = view.bounds;
    [view addSubview:headerV];
    self.tableView.tableHeaderView = view;
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 180)];
    view1.backgroundColor = self.tableView.backgroundColor;
    HomeTableFooterView *footV = [HomeTableFooterView loadViewFromNib];
    footV.frame = CGRectMake(0, 0, kScreenW, 160);
    [view1 addSubview:footV];
    self.tableView.tableFooterView = view1;
}

#pragma mark - HomeTableHeaderViewActions
- (NSArray *)headerViewCellSelectActionArray {
    return @[@"",@""];
}

#pragma mark - HomeTableHeaderViewDelegate
- (void)itemDidSelectAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s %d indexPath = %@",__FUNCTION__,__LINE__,indexPath);

//    NSString *methodStr = [self headerViewCellSelectActionArray][indexPath.row];
//    
//    SEL sel = NSSelectorFromString(methodStr);
//    
//    [self performSelector:sel withObject:nil afterDelay:0.0];
    
//    [self performSelector:sel];
}

- (void)add:(NSNumber *)a b:(NSNumber *)b {}

#pragma mark - HomeTableViewCellDelegate
- (void)moreButtonPressed:(UITableViewCell *)cell {
    self.tabBarController.selectedIndex = 1;
}

- (void)homeTableViewCellItemDidSelectAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95 * 3 + 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 12;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self showViewController:[UIViewController new] sender:nil];
}

@end
