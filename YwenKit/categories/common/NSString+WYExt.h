//
//  NSString+WYExt.h
//  xebest
//
//  Created by ywen on 15/3/11.
//  Copyright (c) 2015年 xianyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (WYExt)

- (BOOL) WY_IsMobileNumber;
- (NSString *) WY_MD5;

@end
