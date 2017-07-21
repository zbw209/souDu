//
//  HomeHotInfoCollectionCell.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "HomeHotInfoCollectionCell.h"

@interface HomeHotInfoCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeHotInfoCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.imageView makeCornerRadius:5];
}

@end
