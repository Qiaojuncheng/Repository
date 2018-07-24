//
//  QJCCodeView.m
//  singdemo
//
//  Created by MYMAc on 2018/7/18.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import "QJCCodeSmallView.h"

@implementation QJCCodeSmallView


-(void)setCodeStr:(NSString *)CodeStr{
    _CodeStr = CodeStr;
    [self setNeedsDisplay];
   
    
   
 }

- (void)drawRect:(CGRect)rect
    {
        [super drawRect:rect];
        
        float red = arc4random() % 100 / 100.0;
        float green = arc4random() % 100 / 100.0;
        float blue = arc4random() % 100 / 100.0;
        
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:0.5];
        [self setBackgroundColor:color];
        
        NSString *text = [NSString stringWithFormat:@"%@",self.CodeStr];
        CGSize cSize = [@"S" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
        int width = rect.size.width / text.length - cSize.width;
        int height = rect.size.height - cSize.height;
        CGPoint point;
        
        float pX, pY;
        for (int i = 0; i < text.length; i++)
        {
            pX = arc4random() % width + rect.size.width / text.length * i;
            pY = arc4random() % (height - 10) + 5;
            point = CGPointMake(pX, pY);
            unichar c = [text characterAtIndex:i];
            NSString *textC = [NSString stringWithFormat:@"%C", c];
            [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
        }
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1.0);
//         显示背景线条
        for(int cout = 0; cout < 10; cout++)
        {
            red = arc4random() % 100 / 100.0;
            green = arc4random() % 100 / 100.0;
            blue = arc4random() % 100 / 100.0;
            color = [UIColor colorWithRed:red green:green blue:blue alpha:0.2];
            CGContextSetStrokeColorWithColor(context, [color CGColor]);
            pX = arc4random() % (int)rect.size.width;
            pY = arc4random() % (int)rect.size.height;
            CGContextMoveToPoint(context, pX, pY);
            pX = arc4random() % (int)rect.size.width;
            pY = arc4random() % (int)rect.size.height;
            CGContextAddLineToPoint(context, pX, pY);
            CGContextStrokePath(context);
        }
    }


@end
