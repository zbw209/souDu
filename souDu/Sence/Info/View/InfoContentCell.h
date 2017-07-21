//
//  InfoContentCell.h
//  souDu
//
//  Created by 多多 on 2017/7/18.
//  Copyright © 2017年 多多. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InfoContentCell;
@protocol InfoContentCellDelegate <NSObject>

- (void)infoContentCellDidSelect:(InfoContentCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@interface InfoContentCell : UICollectionViewCell

- (void)setTableHeaderImageViewHidden:(BOOL)hidden;

@end
