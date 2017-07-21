//
//  ProfileCell.m
//  souDu
//
//  Created by 多多 on 2017/7/14.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "ProfileCell.h"

@interface ProfileCell ()

@property (weak, nonatomic) IBOutlet UIView *topLineView;

@end

@implementation ProfileCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setHideTopLineView:(BOOL)hideTopLineView {
    _hideTopLineView = hideTopLineView;
    _topLineView.hidden = _hideTopLineView;
}

@end
