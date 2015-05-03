//
//  UIImage+WYExt.m
//  YwenKit
//
//  Created by ywen on 15/5/3.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import "UIImage+WYExt.h"

@implementation UIImage (WYExt)

-(UIImage *)WY_Strech:(CGFloat)horizontal vertical:(CGFloat)vertical {
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake((self.size.height - 1) / 2 + vertical, (self.size.width - 1) / 2 + horizontal, (self.size.height - 1) / 2 - vertical, (self.size.width - 1) / 2 - horizontal) resizingMode:UIImageResizingModeStretch];
}

@end
