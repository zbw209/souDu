//
//  BaseVC.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupSubViews];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setupData {}
- (void)setupSubViews {}

@end
