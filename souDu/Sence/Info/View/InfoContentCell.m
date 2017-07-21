//
//  InfoContentCell.m
//  souDu
//
//  Created by 多多 on 2017/7/18.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "InfoContentCell.h"
#import "InfoContentTableViewCell.h"
#import "SDCycleScrollView.h"

@interface InfoContentCell ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation InfoContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupSubViews];
}

- (void)setupSubViews {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:kNib(@"InfoContentTableViewCell") forCellReuseIdentifier:@"InfoContentTableViewCell"];
}

- (void)setTableHeaderImageViewHidden:(BOOL)hidden {
    if (!hidden) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 200 * kScreenWScale)];
        view.backgroundColor = kUIColorFromRGB(0x2B62E9);
        
        CGRect frame = CGRectMake(0, 0, kScreenW, 200 * kScreenWScale);
        SDCycleScrollView *sdScrollV = [SDCycleScrollView cycleScrollViewWithFrame:frame imageNamesGroup:@[[UIImage imageNamed:@"235X146(8)"],[UIImage imageNamed:@"home_peitu"]]];
        sdScrollV.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        sdScrollV.titlesGroup = @[@"负债过多如何办理贷款？",@"身份证储蓄卡贷款怎么贷？"];
        self.tableView.tableHeaderView = sdScrollV;
    }else {
        self.tableView.tableHeaderView = nil;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"InfoContentTableViewCell" forIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 94;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
}




@end
