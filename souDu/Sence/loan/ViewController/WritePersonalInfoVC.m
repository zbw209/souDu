//
//  WritePersonalInfoVC.m
//  souDu
//
//  Created by 多多 on 2017/7/11.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "WritePersonalInfoVC.h"
#import "PersonalInfoViewModel.h"
#import "PersonalInfoBaseCell.h"

@interface WritePersonalInfoVC ()<UITableViewDelegate,UITableViewDataSource,PersonalInfoBaseCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *viewModelArray;
@end

@implementation WritePersonalInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"完善申请信息";
    
    self.viewModelArray = [PersonalInfoViewModel viewModelArray];
}

- (IBAction)submitButtonPressed:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

#pragma mark - CellDidSelectActions
- (void)ziCanCellDidSelect {
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}

#pragma mark - PersonalInfoBaseCellDelegate
- (void)textFieldDidChanged:(UITableViewCell *)cell text:(NSString *)text {
    
    NSLog(@"%s,%d text = %@",__FUNCTION__,__LINE__,text);
    
    NSLog(@"%s,%d indexPath = %@",__FUNCTION__,__LINE__,[self.tableView indexPathForCell:cell]);
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModelArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalInfoViewModel *model = self.viewModelArray[indexPath.section][indexPath.row];
    
    PersonalInfoBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier forIndexPath:indexPath];
    cell.textFieldKeyboardType = model.textFieldKeyboardType;
    cell.hideTopLine = (indexPath.row == 0);
    cell.leftTitle = model.leftTitle;
    cell.delegate = self;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section > 0 ? @"贷款信息" :@"基本信息";
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section == self.viewModelArray.count - 1 ? 20 : 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalInfoViewModel *model = self.viewModelArray[indexPath.section][indexPath.row];
    if (![StringCheck isStringEmpty:model.cellSelectedActionName] &&
        [self respondsToSelector:NSSelectorFromString(model.cellSelectedActionName)]) {
        [self performSelector:NSSelectorFromString(model.cellSelectedActionName) withObject:nil];
    }
}


@end
