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
-(BOOL) WY_IsMobileNumberStrict;
- (NSString *) WY_MD5;
- (BOOL) WY_IsEmpty;
-(BOOL) WY_IsNumber;
-(BOOL) WY_IsBankCard;
-(BOOL) WY_IsIdCard;
-(BOOL) WY_IsEmail;
-(BOOL) WY_IsLetter;
-(BOOL) WY_IsNumberOrLetter;
-(NSString *) WY_TrimStyle;


+(NSString *) WY_RandomString: (NSInteger) length;

@end
