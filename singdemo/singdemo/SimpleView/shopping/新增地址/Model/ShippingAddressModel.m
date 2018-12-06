//
//  ShippingAddressModel.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/19.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ShippingAddressModel.h"
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
@implementation ShippingAddressModel
-(id)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.address_id = dic[@"a_id"];
        self.a_id = dic[@"a_id"];
        self.user_id = dic[@"user_id"];
        self.name = dic[@"name"];
        self.phone = dic[@"phone"];
        self.location = dic[@"location"];
        self.address = dic[@"address"];
        self.isDefault = dic[@"is_default"];
        self.create_time = dic[@"create_time"];
        if ([dic[@"is_default"] isEqualToString:@"1"]) {
            self.isSelected = YES;
        }else{
            self.isSelected = NO;
        }
        
    }
    return self;
}
@end
