//
//  HomeHeaderCollectionCell.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "HomeHeaderCollectionCell.h"

@interface HomeHeaderCollectionCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelLeftLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageRightLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidthLayout;

@end

@implementation HomeHeaderCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.labelLeftLayout.constant = 20 * kScreenWScale;
    self.imageRightLayout.constant = 20 * kScreenWScale;
    self.imageWidthLayout.constant = 48 * kScreenWScale;
    
}

@end
