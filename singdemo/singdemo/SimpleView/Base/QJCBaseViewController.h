//
//  QJCBaseViewController.h
//  singdemo
//
//  Created by MYMAc on 2018/7/21.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

@interface QJCBaseViewController : UIViewController

@end


@interface Model : NSObject
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, copy) NSString *name;

@end
