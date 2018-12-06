//
//  TagsFrame.h
//  singdemo
//
//  Created by MYMAc on 2018/7/30.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

//标签frame封装
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define TagsTitleFont [UIFont systemFontOfSize:13]

@interface TagsFrame : NSObject
/** 标签名字数组 */
@property (nonatomic, strong) NSArray *tagsArray;
/** 标签frame数组 */
@property (nonatomic, strong) NSMutableArray *tagsFrames;
/** 全部标签的高度 */
@property (nonatomic, assign) CGFloat tagsHeight;
/** 标签间距 default is 10*/
@property (nonatomic, assign) CGFloat tagsMargin;
/** 标签行间距 default is 10*/
@property (nonatomic, assign) CGFloat tagsLineSpacing;
/** 标签最小内边距 default is 10*/
@property (nonatomic, assign) CGFloat tagsMinPadding;

/**
一行显示 还是多行显示
 */
@property (assign , nonatomic) BOOL oneLine;
/** 只有一行时 标签的宽度 */
@property (nonatomic, assign) CGFloat tagsWidth;

@end
