//
//  BaseNavigationVC.h
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationVC : UINavigationController

@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

- (void)setNavigationBarColor:(UIColor *)color;

@end
