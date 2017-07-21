//
//  UIView+RoundRect.m
//  dyddoctor
//
//  Created by 周必稳 on 16/4/12.
//  Copyright © 2016年 IOCDOC. All rights reserved.
//

#import "UIView+RoundRect.h"

@implementation UIView (RoundRect)

- (void)makeCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.clipsToBounds = YES;
}

@end
