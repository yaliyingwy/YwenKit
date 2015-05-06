//
//  NSString+WYExt.m
//  xebest
//
//  Created by ywen on 15/3/11.
//  Copyright (c) 2015年 xianyi. All rights reserved.
//

#import "NSString+WYExt.h"


@implementation NSString (WYExt)

- (BOOL) WY_IsMobileNumber {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    
    NSString *mobile = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *cm = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString *cu = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString *ct = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    NSPredicate *regCm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cm];
    NSPredicate *regCu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", cu];
    NSPredicate *regCt = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ct];
    
    if ([regMobile evaluateWithObject:self] == YES || [regCm evaluateWithObject:self] == YES || [regCt evaluateWithObject:self] == YES || [regCu evaluateWithObject:self] == YES ) {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

-(NSString *)WY_MD5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

-(BOOL)WY_IsEmpty {
    return (self == nil || [self isEqual:[NSNull null]] || [self isEqualToString:@""]);
}

+(NSString *) WY_RandomString:(NSInteger)length {
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789!@#$%^&*()?<>{}";
    NSMutableString *s = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i = 0U; i < length; i++) {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return s;
}

@end
