//
//  UIButton+WYExt.h
//  YwenKit
//
//  Created by ywen on 15/5/13.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WYExt)

@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

-(void) WY_SetBgColor:(NSInteger) bgColor title:(NSString *) title titleColor:(NSInteger) titleColor corn:(CGFloat) corn fontSize: (CGFloat) fontSize;

@end
