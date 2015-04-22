//
//  UIView+WYExt.m
//  xebest
//
//  Created by ywen on 15/3/11.
//  Copyright (c) 2015年 xianyi. All rights reserved.
//

#import "UIView+WYExt.h"

@implementation UIView (WYExt)

-(void) WY_MakeCorn:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

@end
