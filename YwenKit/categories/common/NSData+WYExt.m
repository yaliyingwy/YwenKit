//
//  NSData+WYExt.m
//  YwenKit
//
//  Created by ywen on 15/5/3.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import "NSData+WYExt.h"

@implementation NSData (WYExt)

-(NSDictionary *)WY_ToDic {
    id jsonObj = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];
    if ([jsonObj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)jsonObj;
    }
    else
    {
        return nil;
    }
}

-(NSArray *)WY_ToArray {
    id jsonObj = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];
    if ([jsonObj isKindOfClass:[NSArray class]]) {
        return (NSArray *)jsonObj;
    }
    else
    {
        return nil;
    }
}

@end
