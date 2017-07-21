//
//  ApplyLoanTableSectionModel.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "ApplyLoanTableSectionModel.h"

@implementation ApplyLoanTableSectionModel

+ (instancetype)sectionModel:(BOOL)expand subNodeCount:(NSInteger)subNodeCount {
    ApplyLoanTableSectionModel *model = [ApplyLoanTableSectionModel new];
    model.expand = expand;
    model.subNodeCount = subNodeCount;
    return model;
}

@end
