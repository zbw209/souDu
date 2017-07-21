//
//  UISearchBar+JCSearchBarPlaceholder.m
//  GestureSummary
//
//  Created by xuxingjun on 16/10/20.
//  Copyright © 2016年 JC. All rights reserved.
//

#import "UISearchBar+JCSearchBarPlaceholder.h"

@implementation UISearchBar (JCSearchBarPlaceholder)

-(void)changeLeftPlaceholder:(NSString *)placeholder {
    self.placeholder = placeholder;
    SEL centerSelector = NSSelectorFromString([NSString stringWithFormat:@"%@%@", @"setCenter", @"Placeholder:"]);
    if ([self respondsToSelector:centerSelector]) {
        BOOL centeredPlaceholder = NO;
        NSMethodSignature *signature = [[UISearchBar class] instanceMethodSignatureForSelector:centerSelector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:centerSelector];
        [invocation setArgument:&centeredPlaceholder atIndex:2];
        [invocation invoke];
    }
}

- (void)setTextFieldFont:(UIFont *)font {
    UITextField * searchField = [self valueForKey:@"_searchField"];
    [searchField setValue:font forKeyPath:@"_placeholderLabel.font"];

}

- (void)setTextFieldTextColor:(UIColor *)color {
    UITextField * searchField = [self valueForKey:@"_searchField"];
    [searchField setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setTextFieldBackgroundColor:(UIColor *)color {
    for (UIView *view in self.subviews) {
        for (UIView *subV in view.subviews) {
            if ([subV isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                subV.alpha = 0;
            }else {
                subV.backgroundColor = color;
            }
        }
    }
}

@end
