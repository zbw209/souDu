//
//  InfoTitleCell.m
//  souDu
//
//  Created by 多多 on 2017/7/18.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "InfoTitleCell.h"

@implementation InfoTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.titleLabel.textColor = selected ? kUIColorFromRGB(0x2487ff) : kUIColorFromRGB(0x2A2E32);
}

@end
