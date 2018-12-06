//
//  MiddleItemView.h
//  singdemo
//
//  Created by MYMAc on 2018/7/31.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectBlock) (NSInteger index);
@interface MiddleItemView : UIView

@property (copy , nonatomic ) selectBlock selectItem;
@property (strong , nonatomic ) UIColor * titleColor;
@end
