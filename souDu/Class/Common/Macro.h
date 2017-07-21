//
//  Macro.h
//  souDu
//
//  Created by 多多 on 2017/7/12.
//  Copyright © 2017年 多多. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define kStoryboard(storyboardName) [UIStoryboard storyboardWithName:storyboardName bundle:nil]
#define kVCFromStoryboard(storyboard,vcName) [storyboard instantiateViewControllerWithIdentifier:vcName] 

#define kNib(nibName) [UINib nibWithNibName:nibName bundle:nil]

#define kUIFont(x) [UIFont systemFontOfSize:x]
#define kUIFontB(x) [UIFont boldSystemFontOfSize:x]

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define kScreenWScale kScreenW / 375.0 // UI效果图宽度适配比例
#define kScreenHScale kScreenH / 667.0 // UI图高度适配比例

#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kARCColor [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0]

#define kAddNotification(target,action,notificationName) [[NSNotificationCenter defaultCenter] addObserver:target selector:action name:notificationName object:nil];

#define kRemoveNotification(target,notificationName) [[NSNotificationCenter defaultCenter] removeObserver:target name:notificationName object:nil];





#endif /* Macro_h */
