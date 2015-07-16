//
//  Loading.h
//  b2c
//
//  Created by ywen on 15/7/15.
//
//

#import <UIKit/UIKit.h>

@interface Loading : UIView
{
    UIWindow *_window;
    
    UIActivityIndicatorView *_activity;
    UIView *_dialogView;
    UILabel *_dialogLabel;
}

+(void) show:(NSString *) message isForce: (BOOL) isForce;
+(void) hide;

@end
