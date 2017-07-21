//
//  ProfileVC.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "ProfileVC.h"
#import "ProfileCell.h"
#import "ProfileTableHeaderView.h"


@interface ProfileVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)setupData {
    _titleArray = @[@[@"借款记录"]
                    ,@[@"关于我们",@"常见问题",@"贷款咨询"]
                    ,@[@"设置"]];
    
    _imageArray = @[@[@"04-icon-loan"]
                    ,@[@"04-icon-about",@"04-icon-problem",@"04-icon-advisory"]
                    ,@[@"04-icon-set"]];
}

- (void)setupSubViews {
    [self setupTableView];
}

- (void)setupTableView {
    ProfileTableHeaderView *headerView = [ProfileTableHeaderView loadViewFromNib];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 160 * kScreenHScale)];
    headerView.frame = view.bounds;
    [view addSubview:headerView];
    self.tableView.tableHeaderView = view;
    
    [headerView userLoginAction:^{
        [self showDetailViewController:kVCFromStoryboard(kStoryboard(@"Login"), @"LoginVC") sender:nil];
    }];
}

- (IBAction)testButtonPressed:(id)sender {
    if (![UserCenter isLogin]) {
        [self showDetailViewController:kStoryboard(@"Login").instantiateInitialViewController sender:nil];
//        [UserCenter saveUserInfo:@{@"name" : @"111"}];
    }else {
        NSLog(@"%s %d 用户已登录",__FUNCTION__,__LINE__);
//        [UserCenter deleteUserInfo]; 
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titleArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileCell" forIndexPath:indexPath];
    cell.titleLabel.text = _titleArray[indexPath.section][indexPath.row];
    cell.leftImageView.image = [UIImage imageNamed:_imageArray[indexPath.section][indexPath.row]];
    if (indexPath.row == 0) {
        cell.hideTopLineView = YES;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showViewController:kVCFromStoryboard(self.storyboard, @"SettingVC") sender:nil];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 12)];
    view.backgroundColor = kUIColorFromRGB(0xedecf3);
    return view;
}



@end
