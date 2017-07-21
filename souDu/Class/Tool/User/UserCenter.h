//
//  KYUserCenter.h
//  chufangguanjiaDoctor
//
//  Created by 周必稳 on 2017/4/10.
//  Copyright © 2017年 iocdoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface UserCenter : NSObject

+ (void)saveUserInfo:(NSDictionary *)userDict;

+ (User *)getUserInfo;

+ (void)deleteUserInfo;

+ (BOOL)isLogin;

@end
