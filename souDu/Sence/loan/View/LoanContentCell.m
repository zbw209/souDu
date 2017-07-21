//
//  LoanContentCell.m
//  souDu
//
//  Created by 多多 on 2017/7/18.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "LoanContentCell.h"
#import "LoanCell.h"

@interface LoanContentCell ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LoanContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupSubViews];
}

- (void)setupSubViews {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:kNib(@"LoanCell") forCellReuseIdentifier:@"LoanCell"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"LoanCell" forIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(loanContentCellDidSelect:atIndexPath:)]) {
        [self.delegate loanContentCellDidSelect:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
    }
}

@end
