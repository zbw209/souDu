//
//  InputCell.m
//  souDu
//
//  Created by zhoubiwen on 2017/7/21.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "InputCell.h"
#import "PersonalInfoBaseCell.h"

@interface InputCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIView *topLineView;

@end

@implementation InputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    kAddNotification(self, @selector(textFieldDidChanged:), UITextFieldTextDidChangeNotification)
    
}

- (void)setLeftTitle:(NSString *)leftTitle {
    [super setLeftTitle:leftTitle];
    _leftTitleLabel.text = leftTitle;
}

- (void)setHideTopLine:(BOOL)hideTopLine {
    [super setHideTopLine:hideTopLine];
    _topLineView.hidden = hideTopLine;
}

- (void)textFieldDidChanged:(NSNotification *)notification {
    if (!self.window) {
        return;
    }
    
    if (_textField.editing && [self.delegate respondsToSelector:@selector(textFieldDidChanged:text:)]) {
        [self.delegate textFieldDidChanged:self text:_textField.text];
    }
}

- (void)setTextFieldKeyboardType:(UIKeyboardType)textFieldKeyboardType {
    [super setTextFieldKeyboardType:textFieldKeyboardType];
    self.textField.keyboardType = textFieldKeyboardType;
}

@end
