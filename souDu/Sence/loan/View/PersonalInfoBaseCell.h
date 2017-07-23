//
//  PersonalInfoBaseCell.h
//  souDu
//
//  Created by zhoubiwen on 2017/7/21.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonalInfoBaseCellDelegate <NSObject>

@optional
- (void)textFieldDidChanged:(UITableViewCell *)cell text:(NSString *)text;

@end

@interface PersonalInfoBaseCell : UITableViewCell

@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, assign) BOOL hideTopLine;
@property (nonatomic, assign) UIKeyboardType textFieldKeyboardType;

@property (nonatomic, assign) id<PersonalInfoBaseCellDelegate> delegate;

@end
