//
//  QJCItemsScrollerView.m
//  singdemo
//
//  Created by MYMAc on 2018/7/30.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCItemsScrollerView.h"

@implementation QJCItemsScrollerView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}
-(TagsFrame *)Tagframe{
    if (!_Tagframe) {
        _Tagframe = [[TagsFrame alloc] init];
    }
     return _Tagframe;
 }
-(void)setTagsArray:(NSArray *)tagsArray{
    _tagsArray = tagsArray;
    
    self.Tagframe.tagsArray = tagsArray ;
    if (self.Tagframe.oneLine) {
//        一行显示
        self.contentSize = CGSizeMake(self.Tagframe.tagsWidth, self.height);
    }else{
        self.contentSize = CGSizeMake(self.width,self.Tagframe.tagsHeight);
    }
    
    [self makeBtnitem];
    
}
-(void)makeBtnitem{
    for (NSInteger i=0; i< _tagsArray.count; i++) {
        UIButton *tagsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [tagsBtn setTitle:_tagsArray[i] forState:UIControlStateNormal];
        [tagsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        tagsBtn.titleLabel.font = TagsTitleFont;
        tagsBtn.backgroundColor = [UIColor whiteColor];
        tagsBtn.layer.borderWidth = 1;
        tagsBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        tagsBtn.layer.cornerRadius = 4;
        tagsBtn.layer.masksToBounds = YES;
        tagsBtn.frame = CGRectFromString(self.Tagframe.tagsFrames[i]);
        [self addSubview:tagsBtn];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
