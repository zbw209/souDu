//
//  PersonalInfoViewModel.m
//  souDu
//
//  Created by zhoubiwen on 2017/7/21.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "PersonalInfoViewModel.h"

static NSString * inputCell = @"inputCell";
static NSString * selectCell = @"selectCell";

@implementation PersonalInfoViewModel

- (instancetype)init {

    if (self = [super init]) {
        _textFieldPlaceholder = @"请输入";
        _textFieldKeyboardType = UIKeyboardTypeDefault;
        _cellIdentifier = inputCell; //selectCell
    }
    return self;
}

+ (NSArray *)viewModelArray {
    return @[[self firstSectionArray]
             ,[self secondSectionArray]];
}

+ (NSArray *)firstSectionArray {
    NSArray *leftTitleArr = @[@"本人姓名",@"本人身份证号码",@"教育程度",@"资产状况",@"职业类别"];
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < leftTitleArr.count; i++) {
        PersonalInfoViewModel *model = [PersonalInfoViewModel new];
        model.leftTitle = leftTitleArr[i];
        [arr addObject:model];
    }
    
    [arr[0] setTextFieldPlaceholder:@"请输入姓名"];
    [arr[1] setTextFieldKeyboardType:UIKeyboardTypeNumberPad];
    
    [arr[3] setCellSelectedActionName:@"ziCanCellDidSelect"];
    
    for (int i = 2; i <leftTitleArr.count; i++) {
        [arr[i] setCellIdentifier:selectCell];
    }
    return arr;
}

+ (NSArray *)secondSectionArray {
    NSArray *leftTitleArr = @[@"产品",@"申请金额",@"贷款申请期限",@"贷款用途"];
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < leftTitleArr.count; i++) {
        PersonalInfoViewModel *model = [PersonalInfoViewModel new];
        model.leftTitle = leftTitleArr[i];
        [arr addObject:model];
    }
    
    [arr[1] setTextFieldKeyboardType:UIKeyboardTypeASCIICapableNumberPad];
    [arr[3] setCellIdentifier:selectCell];
    return arr;
}




@end
