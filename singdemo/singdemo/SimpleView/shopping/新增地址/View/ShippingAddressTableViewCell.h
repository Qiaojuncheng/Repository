//
//  ShippingAddressTableViewCell.h
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/19.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShippingAddressModel.h"
@protocol ShippingAddressTableViewCellDelegate<NSObject>
-(void)shippingAddressTableViewCellMoRenButtonClick:(UIButton *)button;
-(void)shippingAddressTableViewCelleditButtonClick:(UIButton *)button;
-(void)shippingAddressTableViewCelldeleteButtonClick:(UIButton *)button;
@end
@interface ShippingAddressTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIButton *moRenButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (nonatomic ,strong) ShippingAddressModel *model;
@property (nonatomic ,weak)id<ShippingAddressTableViewCellDelegate>delegate;
@end
