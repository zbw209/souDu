//
//  ApplyLoanTableHeaderView.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "ApplyLoanTableHeaderView.h"

@interface ApplyLoanTableHeaderView ()

@property (weak, nonatomic) IBOutlet UIView *loanInfoBgView;
@property (weak, nonatomic) IBOutlet UIView *marginView;

@end

@implementation ApplyLoanTableHeaderView

+ (instancetype)loadHeaderView {
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self setupSubViews];
}

- (void)setupSubViews {
    [self setupLoanInfoView];
    [self setupApplicationRequirementsAndmateriaRequestedView];
}

- (void)setupLoanInfoView {
    CGFloat width = kScreenW / 4;
    for (int i = 1; i <= 3; i++) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = kARCColor;
        view.frame = CGRectMake(width * i, 25, 1, 21);
        [self.loanInfoBgView addSubview:view];
    }

}

// 申请条件、所需材料
- (void)setupApplicationRequirementsAndmateriaRequestedView {

}


- (CGFloat)viewHeight {

    UIView *applicationRequirementsView = [self requestViewWithTitle:@"申请条件" contentStr:@"借款人持有信用卡，并通过固定电子邮件地址来接受信用卡账单，22-55周岁，有淘宝账号，手机实名制。"];
    
    
    UIView *dmateriaRequestedView = [self requestViewWithTitle:@"所需材料" contentStr:@"提供单张信用卡连续4个月的账单，实名手机认证，淘宝账号信息。提供单张信用卡连续4个月的账单，实名手机认证，淘宝账号信息。提供单张信用卡连续4个月的账单，实名手机认证，淘宝账号信息。提供单张信用卡连续4个月的账单，实名手机认证，淘宝账号信息。提供单张信用卡连续4个月的账单，实名手机认证，淘宝账号信息。提供单张信用卡连续4个月的账单，实名手机认证，淘宝账号信息。"];
    
    
    applicationRequirementsView.frame = CGRectMake(0, CGRectGetMaxY(self.marginView.frame), kScreenW, applicationRequirementsView.height);

    dmateriaRequestedView.frame = CGRectMake(0, CGRectGetMaxY(applicationRequirementsView.frame), kScreenW, dmateriaRequestedView.height);
    
    [self addSubview:applicationRequirementsView];
    [self addSubview:dmateriaRequestedView];
    
    return CGRectGetMaxY(dmateriaRequestedView.frame);
}

- (UIView *)requestViewWithTitle:(NSString *)title contentStr:(NSString *)contentStr {
    
    UIView *view = [[UIView alloc]init];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(22, 16, 0, 0);
    titleLabel.font = kUIFont(15);
    titleLabel.text = title;
    [titleLabel sizeToFit];
    
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.frame = CGRectMake(12, CGRectGetMaxY(titleLabel.frame) + 4, kScreenW - 24, 0);
    contentLabel.textColor = kUIColorFromRGB(0x8d97a3);
    contentLabel.numberOfLines = 0;
    contentLabel.font = kUIFont(14);
    contentLabel.text = contentStr;
    [contentLabel sizeToFit];
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.frame = CGRectMake(0, CGRectGetMaxY(contentLabel.frame) + 16, kScreenW, 12);
    bottomView.backgroundColor = self.marginView.backgroundColor;
    
    [view addSubview:titleLabel];
    [view addSubview:contentLabel];
    [view addSubview:bottomView];
    
    view.frame = CGRectMake(0, 0, kScreenW, CGRectGetMaxY(bottomView.frame));
    return view;
}

@end



