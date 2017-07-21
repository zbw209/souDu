//
//  UIViewController+NavigationBar.m
//  souDu
//
//  Created by 多多 on 2017/7/20.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "UIViewController+NavigationBar.h"

@implementation UIViewController (NavigationBar)

- (void)setNavigationBarBackgroundImage:(UIImage *)bgImage ShadowImage:(UIImage *)shadowImage {
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:shadowImage];
}

@end
