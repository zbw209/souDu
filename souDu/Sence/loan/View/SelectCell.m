//
//  SelectCell.m
//  souDu
//
//  Created by zhoubiwen on 2017/7/21.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "SelectCell.h"

@interface SelectCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *topLineView;

@end

@implementation SelectCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setLeftTitle:(NSString *)leftTitle {
    [super setLeftTitle:leftTitle];
    _leftTitleLabel.text = leftTitle;
}

- (void)setHideTopLine:(BOOL)hideTopLine {
    [super setHideTopLine:hideTopLine];
    _topLineView.hidden = hideTopLine;
}


@end
