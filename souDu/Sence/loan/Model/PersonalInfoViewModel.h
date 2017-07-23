//
//  PersonalInfoViewModel.h
//  souDu
//
//  Created by zhoubiwen on 2017/7/21.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalInfoViewModel : NSObject

@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, strong) NSString *textFieldPlaceholder;
@property (nonatomic, assign) UIKeyboardType textFieldKeyboardType;

@property (nonatomic, strong) NSString *cellSelectedActionName;

+ (NSArray *)viewModelArray;

@end
