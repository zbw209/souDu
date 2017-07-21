//
//  HomeTableViewCell.h
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeTableViewCellDelegate <NSObject>


@optional
- (void)moreButtonPressed:(UITableViewCell *)cell;
- (void)homeTableViewCellItemDidSelectAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, assign) id<HomeTableViewCellDelegate> delegate;

@end
