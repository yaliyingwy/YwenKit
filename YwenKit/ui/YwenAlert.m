//
//  YwenAlert.m
//  YwenKit
//
//  Created by ywen on 15/4/27.
//  Copyright (c) 2015年 ywen. All rights reserved.
//

#import "YwenAlert.h"



@implementation YwenAlert
{
    CallBack _confirmCb;
    CallBack _cancelCb;
}

static YwenAlert *_alert;

-(void) alert: (NSString *) message vc: (UIViewController *) vc confirmString: (NSString *) confirmString confirmBlock: (CallBack) confirmBlock cancelString: (NSString *) cancelString cancelBlock: (CallBack) cancelBlock {
    
    if (IOS8_OR_LATER) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmString style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [alertController dismissViewControllerAnimated:YES completion:confirmBlock];
        }];
        [alertController addAction:confirmAction];
        
        if (cancelString != nil) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelString style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                [alertController dismissViewControllerAnimated:YES completion:cancelBlock];
            }];
            [alertController addAction:cancelAction];
        }
        
        [vc presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.title message:message delegate:self cancelButtonTitle:cancelString otherButtonTitles: nil];
        _confirmCb = confirmBlock ? confirmBlock : nil;
        _cancelCb = cancelBlock ? cancelBlock : nil;
        [alertView show];
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0 && _cancelCb != nil) {
         _cancelCb();
    }
    else if (buttonIndex == 1 && _confirmCb != nil)
    {
        _confirmCb();
    }
}

+(void)setTitle:(NSString *)title {
    [YwenAlert checkInstance];
    _alert.title = title;
}


+(void)alert:(NSString *)msg vc:(UIViewController *)vc {
    [YwenAlert checkInstance];
    [_alert alert:msg vc:vc confirmString:@"确定" confirmBlock:nil cancelString:nil cancelBlock:nil];
}

+(void)alertWithCancel:(NSString *)msg vc:(UIViewController *)vc {
    [YwenAlert checkInstance];
    [_alert alert:msg vc:vc confirmString:@"确定" confirmBlock:nil cancelString:@"取消" cancelBlock:nil];
}

+(void)alert:(NSString *)msg vc:(UIViewController *)vc confirmStr:(NSString *)confirmStr confirmCb:(CallBack)confirmCb cancelStr:(NSString *)cancelStr cancelCb:(CallBack)cancelCb {
    [YwenAlert checkInstance];
    [_alert alert:msg vc:vc confirmString:confirmStr confirmBlock:confirmCb cancelString:cancelStr cancelBlock:cancelCb];
}

+(void) checkInstance {
    if (_alert == nil) {
        _alert = [[YwenAlert alloc] init];
        _alert.title = @"提示";
    }
}
                                              
                                              

@end
