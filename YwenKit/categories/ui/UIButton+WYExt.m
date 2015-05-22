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
#import <objc/runtime.h>

@implementation UIButton (WYExt)

//MARK: 扩大button点击区域
@dynamic hitTestEdgeInsets;

static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"HitTestEdgeInsets";

-(void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) ||       !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}


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
