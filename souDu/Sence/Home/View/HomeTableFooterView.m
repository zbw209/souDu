//
//  HomeTableFooterView.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "HomeTableFooterView.h"

@interface HomeTableFooterView ()

@property (weak, nonatomic) IBOutlet UIView *carView;
@property (weak, nonatomic) IBOutlet UIView *houseView;
@property (weak, nonatomic) IBOutlet UIView *loanView;

@end

@implementation HomeTableFooterView

- (void)awakeFromNib {
    [super awakeFromNib];

    UIColor *color = kUIColorFromRGB(0xe5e9ed);
    self.carView.layer.borderColor = color.CGColor;
    self.houseView.layer.borderColor = color.CGColor;
    self.loanView.layer.borderColor = color.CGColor;

    CGFloat width = 1.0;
    self.carView.layer.borderWidth = width;
    self.houseView.layer.borderWidth = width;
    self.loanView.layer.borderWidth = width;

}

@end
