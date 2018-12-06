//
//  goodsdetailBottomView.m
//  singdemo
//
//  Created by MYMAc on 2018/8/2.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "goodsdetailBottomView.h"

@implementation goodsdetailBottomView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self show];
    }
    
    return self ;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)show{
    //底部客服
    
    UIImageView *images = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth/3  -40)/3  , self.height - 40, 20, 20)];
    images.image = [UIImage imageNamed:@"客服q"];
    [self addSubview:images];
    
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth/3  -40)/3 , self.height - 20, ScreenWidth/6, 20)];
    
    titleLab.centerX = images.centerX;
    titleLab.text = [NSString stringWithFormat:@"客服"];
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor colorWithHex:0x999999];
    [self addSubview:titleLab];
    
    UIButton *btns = [[UIButton alloc]initWithFrame:CGRectMake(0, self.height - 44, ScreenWidth/6, 44)];
    btns.tag = 11;
    [btns addTarget:self action:@selector(didDiBuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btns];
    //
    // 收藏
    UILabel *titleLabTwo = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth/6 ,self.height - 20, ScreenWidth/6, 20)];
    titleLabTwo.text = [NSString stringWithFormat:@"收藏"];
    titleLabTwo.font = [UIFont systemFontOfSize:14];
    titleLabTwo.textAlignment = NSTextAlignmentCenter;
    titleLabTwo.textColor = [UIColor colorWithHex:0x999999];
    [self addSubview:titleLabTwo];
   UIImageView *  imagestwo = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth/3  -40)/3 *2 + 20 , self.height - 40, 20, 20)];
    imagestwo.image = [UIImage imageNamed:@"收藏q"];
    titleLabTwo.centerX = imagestwo.centerX;
    
    [self addSubview:imagestwo];
    UIButton *btnstwo = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/6, self.height - 44, ScreenWidth/6, 44)];
    btnstwo.tag = 10;
    [btnstwo addTarget:self action:@selector(didDiBuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnstwo];
    // 购物车  立即购买
    NSArray *anniuBtn = [NSArray arrayWithObjects:@"加入购物车",@"立即购买", nil];
    
    NSArray *colorArr = @[MAINCOLOR,[UIColor colorWithHex:0xff5000]];
    for (int i = 0; i < 2; i ++) {
        UIButton *btns = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/3 + i*(ScreenWidth/3), self.height -  46, ScreenWidth/3, 46)];
        [btns setTitle:[NSString stringWithFormat:@"%@",anniuBtn[i]] forState:normal];
        [btns setTitleColor:[UIColor whiteColor] forState:normal];
        btns.backgroundColor = [colorArr objectAtIndex:i];
        btns.titleLabel.font = [UIFont systemFontOfSize:14];
        [btns addTarget:self action:@selector(didGouwucheButton:) forControlEvents:UIControlEventTouchUpInside];
        btns.tag = 20 +i;
        [self addSubview:btns];
    }
    
    
}

-(void)didDiBuButton:(UIButton *)sender{
    
    if (sender.tag == 10) {
        NSLog(@"收藏");
    }else if (sender.tag == 11)
    {
        NSLog(@"客服");

    }
 
}

-(void)didGouwucheButton:(UIButton *)sender{
    if (sender.tag == 20) {
        NSLog(@"加入购物车");
    }else if (sender.tag == 21){
        NSLog(@"立即购买");
    }

}

@end
