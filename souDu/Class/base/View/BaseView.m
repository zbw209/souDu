//
//  BaseView.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

+ (instancetype)loadViewFromNib {
    
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}


@end
