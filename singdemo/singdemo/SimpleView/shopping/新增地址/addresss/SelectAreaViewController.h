//
//  SelectAreaViewController.h
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/21.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectAreaViewController : UIViewController
@property (nonatomic ,copy)void(^selectAreaBlack)(NSString *area);
@end
