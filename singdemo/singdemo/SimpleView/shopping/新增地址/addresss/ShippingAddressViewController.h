//
//  ShippingAddressViewController.h
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/19.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShippingAddressModel.h"

@interface ShippingAddressViewController : UIViewController
@property (nonatomic ,strong)NSArray *goodsArray;
@property (nonatomic ,strong)NSString *totalMoneyStr;

@property (assign ,nonatomic)  BOOL EnsureIsBack;// yes 的时候  确定按钮返回 所选的地址
- (IBAction)addNewAdressButtonClick:(id)sender;

@property (strong ,nonatomic) void(^BackModel)(ShippingAddressModel *Selectmodel);

@end
