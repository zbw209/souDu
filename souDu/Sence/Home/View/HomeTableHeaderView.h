//
//  HomeTableHeaderView.h
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeTableHeaderViewDelegate <NSObject>

@optional
- (void)itemDidSelectAtIndexPath:(NSIndexPath *)indexPath;
- (void)imageDidClickAtIndex:(NSInteger)index;

@end

@interface HomeTableHeaderView : UIView

@property (nonatomic, assign) id<HomeTableHeaderViewDelegate> delegate;

+ (instancetype)loadHeaderView;

- (void)clickImage:(void(^)(NSInteger index))imageAction;

@end
