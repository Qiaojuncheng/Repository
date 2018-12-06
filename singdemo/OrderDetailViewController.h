//
//  OrderDetailViewController.h
//  GuKe
//
//  Created by MYMAc on 2018/8/8.
//  Copyright © 2018年 shangyukeji. All rights reserved.
//

#import "QJCBaseViewController.h"
typedef void (^ realoadDataBlock)(void);
@interface OrderDetailViewController : QJCBaseViewController
@property (strong ,nonatomic) NSString * urlStr;
@property (copy, nonatomic) realoadDataBlock reloadBlock;
@end
