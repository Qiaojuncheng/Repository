//
//  ShippingAddressModel.h
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/19.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 {
 "id":"2",（ID）
 "user_id":"1",（用户ID）
 "name":"宝宝",（收件人名称）
 "phone":"110",（联系电话）
 "location":"河南郑州",（地址）
 "address":"大学科技园",（详细地址）
 "default":"0",（1默认）
 "create_time":"1491549846"
 },
 */
@interface ShippingAddressModel : NSObject
@property (nonatomic ,strong)NSString *address_id;
@property (nonatomic ,strong)NSString *user_id;
@property (nonatomic ,strong)NSString *name;
@property (nonatomic ,strong)NSString *phone;
@property (nonatomic ,strong)NSString *location;
@property (nonatomic ,strong)NSString *address;
@property (nonatomic ,strong)NSString *isDefault;
@property (nonatomic ,strong)NSString *create_time;
@property (nonatomic ,strong)NSString *a_id;
@property (nonatomic ,strong)NSString *id;
@property (nonatomic ,assign)BOOL isSelected;
-(id)initWithDictionary:(NSDictionary *)dic;
@end
