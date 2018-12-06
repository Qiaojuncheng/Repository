//
//  MoRenSelectedView.m
//  ChaseFishProject
//
//  Created by 朱佳男 on 2017/3/19.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "MoRenSelectedView.h"

@implementation MoRenSelectedView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 100, 35)];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor =DEEPTintColor;
        label.text = @"默认地址";
        [self addSubview:label];
        
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(label.frame)+8, ScreenWidth-16, 20)];
        detailLabel.font = [UIFont systemFontOfSize:13];
        detailLabel.textColor = [UIColor colorWithHex:0x666666];
        detailLabel.text = @"每次下单时默认使用该地址";
//        [self addSubview:detailLabel];
        
        self.cSwithch = [[UISwitch alloc]initWithFrame:CGRectMake(ScreenWidth-68, 9, 60, 25)];
        [self addSubview:self.cSwithch];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
