//
//  AppDelegate.m
//  souDu
//
//  Created by 多多 on 2017/7/11.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupWindow];
    [self globalConfig];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}

#pragma mark - Actions
- (void)setupWindow {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [BaseTabBarVC new];
    [self.window makeKeyAndVisible];
}

- (void)globalConfig {
    [IQKeyboardManager sharedManager].shouldShowTextFieldPlaceholder = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

@end
