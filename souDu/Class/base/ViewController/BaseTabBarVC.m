//
//  BaseTabBarVC.m
//  souDu
//
//  Created by 多多 on 2017/7/11.
//  Copyright © 2017年 多多. All rights reserved.
//

#import "BaseTabBarVC.h"

@interface BaseTabBarVC ()

@property (nonatomic, strong) NSArray *childrenVCArray;

@end

@implementation BaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildrenVC];
}

- (void)setupChildrenVC {
    for (NSDictionary * dict in [self childrenVCArray]) {
       UIViewController *vc = [UIStoryboard storyboardWithName:dict[@"storyboardName"] bundle:nil].instantiateInitialViewController;
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:dict[@"title"] image:[UIImage imageNamed:dict[@"imageName"]] selectedImage:[UIImage imageNamed:dict[@"selectedImageName"]]];
        [self addChildViewController:vc];
    }
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
//    [self.tabBar setTintColor:kUIColorFromRGB(0x6cb7ff)];
}

- (NSArray *)childrenVCArray {
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:[self storyboardName:@"Home" title:@"首页" imageName:@"tab-icon-home" selectedImageName:@"tab-icon-home-p"]];
    [arr addObject:[self storyboardName:@"Loan" title:@"贷款" imageName:@"tab-icon-loan" selectedImageName:@"tab-icon-loan-p"]];
    [arr addObject:[self storyboardName:@"Info" title:@"资讯" imageName:@"tab-icon-Information" selectedImageName:@"tab-icon-Information-p"]];
    [arr addObject:[self storyboardName:@"Profile" title:@"个人中心" imageName:@"tab-icon-mine" selectedImageName:@"tab-icon-mine-p"]];
    return arr;
}

- (NSDictionary * )storyboardName:(NSString *)storyboardName
                            title:(NSString *)title
                        imageName:(NSString *)imageName
                selectedImageName:(NSString *)selectedImageName {
    return @{@"storyboardName" : storyboardName,
             @"title" : title,
             @"imageName" : imageName,
             @"selectedImageName" : selectedImageName};
}






@end
