//
//  LoanCell.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "LoanCell.h"

@interface LoanCell ()

@property (weak, nonatomic) IBOutlet UIImageView *loanImageView;
@property (weak, nonatomic) IBOutlet UILabel *loanNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *applyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation LoanCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self.loanImageView makeCornerRadius:5];
}

@end
