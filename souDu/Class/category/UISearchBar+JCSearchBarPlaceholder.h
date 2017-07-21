//
//  UISearchBar+JCSearchBarPlaceholder.h
//  GestureSummary
//
//  Created by xuxingjun on 16/10/20.
//  Copyright © 2016年 JC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (JCSearchBarPlaceholder)

// 占位文字左对齐
-(void)changeLeftPlaceholder:(NSString *)placeholder;

- (void)setTextFieldFont:(UIFont *)font;
- (void)setTextFieldTextColor:(UIColor *)color;
- (void)setTextFieldBackgroundColor:(UIColor *)color;

@end
