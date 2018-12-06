//
//  QjcHeader.h
//  singdemo
//
//  Created by MYMAc on 2018/7/20.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#ifndef QjcHeader_h
#define QjcHeader_h





#define RequestUrl   @"http://dakawl.com/"
#define GetImageCode @"app/login/getCode"



#pragma mark    尺寸适配
#define MainScreen [[UIScreen mainScreen] bounds]
#define ScreenWidth  MainScreen.size.width
#define ScreenHeight  MainScreen.size.height
#define IS_IPHONE_5 (ScreenHeight == 568.0)
// 导航栏 加 状态栏
#define NavStatusBarHeight (44 + StatusBarHeight)
// 导航栏高度
#define NavBarHeight 44
//有导航控制器的时候 Tababar高度
#define NavTabBarHeight [self.navigationController.tabBarController.tabBar frame].size.height
// Tababar高度
#define TabBarHeight [self.tabBarController.tabBar frame].size.height
// 状态栏高度
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

//比例 以iPhone6 为基准
#define kRatio ScreenWidth/375
//按比例适配
#define kFit(num)                 kRatio * (num)




#pragma mark     颜色
// 主色 背景色 线条色
#define MAINCOLOR [UIColor colorWithHex:0x216BB0]   // 主色
#define MainBackColor [UIColor colorWithHex:0xf5f5f5] // 背景颜色
#define LINECOLOR [UIColor colorWithHex:0xececec]//线条颜色
#define RandomColor  [UIColor randomColor] // 随机色


// 字体颜色
#define DEEPTintColor [UIColor colorWithHex:0x333333]//字体黑色颜色
#define TintColor [UIColor colorWithHex:0x666666]//字体灰色颜色
#define ShallowTintColor [UIColor colorWithHex:0x999999]//字体浅色颜色


#pragma mark    字体

#define font17 [UIFont systemFontOfSize:17]
#define font16 [UIFont systemFontOfSize:16]
#define font15 [UIFont systemFontOfSize:15]
#define font14 [UIFont systemFontOfSize:14]
#define font12 [UIFont systemFontOfSize:12]


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark ToolHeaders
#import "NSString+XPKit.h"
#import "UIColor+XPKit.h"
#import "UIView+XPKit.h"
#import "Utile.h"
#import "UIImageView+WebCache.h"


#pragma mark ThirdHeaders
#import "UIViewController+HUD.h"
#import "IQKeyboardManager.h"
#import "MJRefresh.h"
#import "GuideViewController.h"
#import "YYModel.h"
#pragma mark SimpleViewHeaders

#import "QJCBaseViewController.h"
#import "QJCNavigationViewController.h"
#import "QJCTabBarController.h"
#import "ZLAdManage.h"
#import "ZLAdvertView.h"
#import "ZLAdvertViewController.h"
#import "YSLoopBanner.h"

#import "MOFSPickerManager.h"





#endif /* QjcHeader_h */
