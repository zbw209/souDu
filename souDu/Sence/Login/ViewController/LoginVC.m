//
//  LoginVC.m
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *mobileTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
}

- (IBAction)quitButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showPasswordButtonPressed:(id)sender {
    self.passwordTextfield.secureTextEntry = !self.passwordTextfield.secureTextEntry;
    if (self.passwordTextfield.secureTextEntry) {
        [self.passwordTextfield insertText:self.passwordTextfield.text];
    }
}


- (IBAction)loginButtonPressed:(id)sender {
}

- (IBAction)forgetPasswordButtonPressed:(id)sender {
}

- (IBAction)registButtonPressed:(id)sender {
}


#pragma mark - UITextFieldDelegate

@end
