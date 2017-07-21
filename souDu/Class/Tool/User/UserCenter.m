//
//  KYUserCenter.m
//  chufangguanjiaDoctor
//
//  Created by 周必稳 on 2017/4/10.
//  Copyright © 2017年 iocdoc. All rights reserved.
//

#import "UserCenter.h"
#import "User.h"

#define kUserDictPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"userInfo"]

@implementation UserCenter

+ (void)saveUserInfo:(NSDictionary *)userDict {
    [NSKeyedArchiver archiveRootObject:userDict toFile:kUserDictPath];
}

+ (User *)getUserInfo {
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:kUserDictPath];
    User *user = nil;
    if (dict != nil) {
        user = [User new];
        [user setValuesForKeysWithDictionary:dict];
    }
    return user;
}

+ (void)deleteUserInfo {
    [[NSFileManager defaultManager]removeItemAtPath:kUserDictPath error:nil];
}

+ (BOOL)isLogin {
    return [self getUserInfo] != nil;
}

@end
