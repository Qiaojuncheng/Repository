//
//  MiddleItemView.m
//  singdemo
//
//  Created by MYMAc on 2018/7/31.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "MiddleItemView.h"

@implementation MiddleItemView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return  self;
}
-(void)didMoveToSuperview{
    [self  makeItem];
}
-(void)makeItem{
    
    NSArray * itemButtontitleAray = @[@"汽车",@"家用电器",@"自动洗衣机",@"麦子大",@"路虎",@"比亚迪",@"青藏高原",@"大河向东流",@"汽车-2"];
    NSArray * itemButtonImageAray = @[@"礼物 ",@"礼物-2",@"礼物-3",@"礼物4",@"礼物-2",@"汽车",@"汽车-2",@"汽车-2"];
    
    CGFloat itemwith  = ScreenWidth/4;
    CGFloat itemheight = self.height/2;
    
    for (int i  = 0 ; i<8  ; i++) {
        UIButton * itembtn =[ UIButton buttonWithType:UIButtonTypeCustom];
        
        itembtn.frame = CGRectMake(itemwith * (i%4) , itemheight  *(i/4) , itemwith, itemheight);
        
        [itembtn setTitle:itemButtontitleAray[i] forState:UIControlStateNormal];
        [itembtn setImage:[UIImage imageNamed:itemButtonImageAray[i]] forState:UIControlStateNormal];
        [itembtn setTintColor:MAINCOLOR];
        [itembtn setBackgroundColor:[UIColor whiteColor]];
        [self maketopimagebottontextWith:itembtn];
        itembtn.tag = 200 + i;
        [itembtn addTarget:self action:@selector(seleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        itembtn.adjustsImageWhenHighlighted = NO;
        [itembtn setTitleColor:self.titleColor?self.titleColor:MAINCOLOR forState:UIControlStateNormal];
        
        [self addSubview:itembtn];
    }
}
-(void)seleBtnAction:(UIButton *)sender{
    if (self.selectItem) {
        self.selectItem(sender.tag - 200);
    }
    
}

-(void)maketopimagebottontextWith:(UIButton *)sender{
    
    sender.titleEdgeInsets = UIEdgeInsetsMake(3, -sender.imageView.frame.size.width, -sender.imageView.frame.size.height, 0);
    
    sender.imageEdgeInsets = UIEdgeInsetsMake(-sender.titleLabel.intrinsicContentSize.height - 5, 0, 0, -sender.titleLabel.intrinsicContentSize.width);
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
