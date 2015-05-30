//
//  YwenImageUrlCache.m
//  YwenKit
//
//  Created by ywen on 15/5/30.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import "YwenImageUrlCache.h"
#import "YwenCache.h"

@implementation YwenImageUrlCache

- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request {
    
    NSString *pathString = [[request URL] absoluteString];
    
    if (![pathString hasSuffix:@".jpg"]) {
        return [super cachedResponseForRequest:request];
    }
    
    NSData *data = [[YwenCache globalCache] get:pathString];
    
    
    if (data != nil) {
       
        NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[request URL]
                                                             MIMEType:@"image/jpg"
                                                expectedContentLength:[data length]
                                                     textEncodingName:nil];
        return [[NSCachedURLResponse alloc] initWithResponse:response data:data];
    }
    else
    {
        return [super cachedResponseForRequest:request];
    }
    
}

- (void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request {
    NSString *pathString = [[request URL] absoluteString];
    if (![pathString hasSuffix:@".jpg"]) {
        [super storeCachedResponse:cachedResponse forRequest:request];
        return;
    }
    
    [[YwenCache globalCache] put: cachedResponse.data forKey:pathString];
}

@end
