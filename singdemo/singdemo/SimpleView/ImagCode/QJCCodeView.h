//
//  QJCCodeView.h
//  singdemo
//
//  Created by MYMAc on 2018/7/18.
//  Copyright © 2018年 ShangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^VlaueBlock) (NSString * token ,NSString *code_name ,NSString * code_value);
@interface QJCCodeView : UIView <UITextFieldDelegate>
@property(copy , nonatomic) VlaueBlock ReaultBlock;
@end
