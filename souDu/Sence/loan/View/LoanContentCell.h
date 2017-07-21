//
//  LoanContentCell.h
//  souDu
//
//  Created by 多多 on 2017/7/18.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoanContentCell;
@protocol LoanContentCellDelegate <NSObject>

@optional
- (void)loanContentCellDidSelect:(LoanContentCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@interface LoanContentCell : UICollectionViewCell

@property (nonatomic, assign) id<LoanContentCellDelegate> delegate;

@end
