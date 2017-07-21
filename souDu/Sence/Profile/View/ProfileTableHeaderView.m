//
//  ProfileTableHeaderView.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "ProfileTableHeaderView.h"
#import "LXWaveProgressView.h"

@interface ProfileTableHeaderView ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarBottomLayout;
@property (nonatomic, copy) void(^userLogin)();

@end

@implementation ProfileTableHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.avatarBottomLayout.constant = 40 * kScreenWScale;
    
}

- (void)setupWave {
    CGFloat height = 100;
    LXWaveProgressView *view = [[LXWaveProgressView alloc]initWithFrame:CGRectMake(0, 167 - height, kScreenW, height)];
    view.speed = 1.3;
    view.progress = 0.5;
    [self addSubview:view];
    [self sendSubviewToBack:view];
}

- (void)userLoginAction:(void(^)())loginAction {

    self.userLogin = loginAction;
}

- (IBAction)loginButtonPressed:(id)sender {
    if (self.userLogin) {
        self.userLogin();
    }
}

@end
