//
//  UIButton+WYExt.m
//  YwenKit
//
//  Created by ywen on 15/5/13.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import "UIButton+WYExt.h"
#import "UIColor+WYExt.h"
#import "UIView+WYExt.h"

@implementation UIButton (WYExt)

-(void)WY_SetBgColor:(NSInteger)bgColor title:(NSString *)title titleColor:(NSInteger)titleColor corn:(CGFloat)corn fontSize:(CGFloat)fontSize {
    self.backgroundColor = [UIColor  WY_ColorWithHex: bgColor];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor WY_ColorWithHex:titleColor] forState:UIControlStateNormal];
    if (corn > 0) {
        [self WY_MakeCorn:corn];
    }
    self.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    
}


@end
