//
//  QJCCodeView.m
//  singdemo
//
//  Created by MYMAc on 2018/7/18.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCCodeView.h"
#import "QJCCodeSmallView.h"
#import "QJCRequestManager.h"
@implementation QJCCodeView {
    NSString * code_name;
    NSString * code_concent;
    NSString * code_token;
    QJCCodeSmallView * imgcodeView ;
    UITextField * imgecodeTextField ;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        [self makeconcentView];
      }
    return self;
}
-(void)makeconcentView{
    [self getImageCodeData];
    
    
    
}
#pragma  mark  获取图形验证码
-(void)getImageCodeData{
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
   code_name = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
 
    NSArray *keysArray = @[@"code_name"];
    
    NSArray *valuesArray = @[code_name];
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:valuesArray forKeys:keysArray];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",RequestUrl,GetImageCode];
    [QJCRequestManager postWithUrlString:urlStr parameters:dic success:^(id data) {
        NSLog(@"data%@",data);
        
        if ([[data[@"code"] stringValue] isEqualToString:@"200"]) {
           self -> code_concent   = [NSString stringWithFormat:@"%@=?",data[@"mes"]] ;
           self-> code_token  = data[@"token"];
            if (self-> imgcodeView) {
               self-> imgcodeView.CodeStr =  self-> code_concent;
            }else{
                [self ShowImageCode];

            }
        }else{
        
//            [ showHint: @"图形验证码获取失败"];
        }
        
    } failure:^(NSError *error) {
//        [self.superview showHint:  @"图形验证码获取失败"];
    }];
 
}
-(void)ShowImageCode{

    
  UIImageView *  _codeImg = [[UIImageView alloc] initWithFrame:CGRectMake(10,15,18 ,18)];
    _codeImg.image = [UIImage imageNamed:@"dxyzm"];
    [self addSubview:_codeImg];

    
   UITextField * _codeField = [[UITextField alloc] initWithFrame:CGRectMake(_codeImg.frame.origin.x + 18+10, 9,250,30)];
    _codeField.placeholder = @"请输入数字题答案的数学数字";
    _codeField.font = [UIFont systemFontOfSize:16];
    _codeField.hidden = NO;
    _codeField.delegate = self;
    _codeField.keyboardType = UIKeyboardTypeNumberPad;
    _codeField.backgroundColor = [UIColor clearColor];
    [self addSubview:_codeField];

    imgcodeView =[[QJCCodeSmallView alloc]initWithFrame:CGRectMake(  _codeImg.frame.origin.x + 18+10  , self.frame.size.height/2, 100, 35)];
    imgcodeView.CodeStr = code_concent;
    imgcodeView.backgroundColor = [UIColor whiteColor];
     [self addSubview:imgcodeView];
    
   
    UILabel * messageL =[[UILabel alloc]initWithFrame:CGRectMake(imgcodeView.frame.origin.x + imgcodeView.frame.size.width +10, imgcodeView.frame.origin.y - 7, ScreenWidth  - (imgcodeView.frame.origin.x + imgcodeView.frame.size.width +10) - 30 , 50)];
    messageL.numberOfLines = 3;
    messageL.font =  [UIFont systemFontOfSize:12];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"请把数学题答案的数字\n填入框中\n看不清？换一张"];
    NSRange range1 = [[str string] rangeOfString:@"数字"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range1];
    NSRange range2 = [[str string] rangeOfString:@"看不清？换一张"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:45/225.0 green:131/225.0 blue:196/225.0 alpha:1] range:range2];
    NSRange range3 = [[str string] rangeOfString:@"协议"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range3];
    messageL.attributedText = str;
    
     [self addSubview:messageL];
   
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(getImageCodeData)];
    messageL.userInteractionEnabled = YES;
    [messageL addGestureRecognizer:tap];
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(self.ReaultBlock){
        self.ReaultBlock(code_token, code_name, textField.text);
    }
    
    NSLog(@"text = %@",textField.text);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
