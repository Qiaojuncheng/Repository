//
//  AddNewAddressViewController.h
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/17.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShippingAddressModel.h"
@interface ZAddNewAddressViewController : UIViewController
@property (nonatomic ,copy)void (^refershAddressListBlock) (void);
@property (nonatomic ,strong)ShippingAddressModel *model;
@end
