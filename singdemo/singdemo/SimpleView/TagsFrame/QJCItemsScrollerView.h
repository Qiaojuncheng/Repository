//
//  QJCItemsScrollerView.h
//  singdemo
//
//  Created by MYMAc on 2018/7/30.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagsFrame.h"
@interface QJCItemsScrollerView : UIScrollView

// 其他属性在 tagframe 里面设置
/** 标签名字数组  先设置 Tagframe.oneLine 是否多行显示*/
@property (nonatomic, strong) NSArray *tagsArray;
/** 标签名字frame */
@property (strong, nonatomic) TagsFrame * Tagframe;


@end
