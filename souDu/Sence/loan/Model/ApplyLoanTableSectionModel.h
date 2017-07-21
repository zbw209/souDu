//
//  ApplyLoanTableSectionModel.h
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplyLoanTableSectionModel : NSObject

@property (nonatomic, assign) BOOL expand;
@property (nonatomic, assign) NSInteger subNodeCount;

+ (instancetype)sectionModel:(BOOL)expand subNodeCount:(NSInteger)subNodeCount;

@end
