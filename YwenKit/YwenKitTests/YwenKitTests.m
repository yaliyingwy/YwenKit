//
//  YwenKitTests.m
//  YwenKitTests
//
//  Created by ywen on 15/8/4.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+WYExt.h"

@interface YwenKitTests : XCTestCase

@end

@implementation YwenKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    NSString *str = @"Z我中";
    NSString *index = [str WY_FirstIndexLetter];
    NSLog(@"index------%@", index);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
