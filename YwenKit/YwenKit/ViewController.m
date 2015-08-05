//
//  ViewController.m
//  YwenKit
//
//  Created by ywen on 15/8/4.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    YwenGestureLockView *lockView = [[YwenGestureLockView alloc] initWithFrame:self.view.bounds];
    lockView.contentInsets = UIEdgeInsetsMake(80, 20, 80, 20);
    lockView.nodeSize = 60;
    [lockView createUI];
    lockView.delegate = self;
    [self.view addSubview:lockView];
}

-(void)lockView:(YwenGestureLockView *)lockView didBeginWithPasscode:(NSString *)passCode {
    NSLog(@"begin passwd %@", passCode);
}

-(void)lockView:(YwenGestureLockView *)lockView didCancelWithPasscode:(NSString *)passCode {
     NSLog(@"cancel passwd %@", passCode);
}

-(void)lockView:(YwenGestureLockView *)lockView didEndWithPasscode:(NSString *)passCode {
     NSLog(@"end passwd %@", passCode);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
