//
//  Loading.m
//  b2c
//
//  Created by ywen on 15/7/15.
//
//

#import "Loading.h"
#import "YwenKit.h"

@implementation Loading



-(void) createUI {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.translatesAutoresizingMaskIntoConstraints = YES;
    _window.windowLevel = UIWindowLevelAlert;
    _window.backgroundColor = [UIColor WY_ColorWithHex:0x000000 alpha:0.2];
    
    [_window makeKeyAndVisible];
    
    [_window addSubview:self];
    
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor clearColor];
    
    
    NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[self]-0-|"
                                                                    options:NSLayoutFormatAlignAllLeading|NSLayoutFormatAlignAllTrailing
                                                                    metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(self)];
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[self]-0-|"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(self)];
    [_window addConstraints:constraints1];
    [_window addConstraints:constraints2];
    
    
    
        _dialogView = [UIView new];
        _dialogView.backgroundColor = [UIColor WY_ColorWithHex:0x000000 alpha:0.8];
        _dialogView.translatesAutoresizingMaskIntoConstraints = NO;
        [_dialogView WY_MakeCorn:6];
        [self addSubview:_dialogView];
        
        
        [_window addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=30)-[_dialogView(>=80)]-(>=30)-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:NSDictionaryOfVariableBindings(_dialogView)]];
    
    [_window addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=30)-[_dialogView]-(>=30)-|"
                                                                  options:0
                                                                  metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(_dialogView)]];
        CGFloat offset = -0.05 * SCREEN_HEIGHT;
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_dialogView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:offset]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_dialogView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1
                                                          constant:0]];
        
        
        

    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activity.translatesAutoresizingMaskIntoConstraints = NO;
    [_activity startAnimating];
    [_dialogView addSubview:_activity];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_activity
                                                       attribute:NSLayoutAttributeCenterX
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:_dialogView
                                                       attribute:NSLayoutAttributeCenterX
                                                      multiplier:1
                                                         constant:0]];
    
        _dialogLabel = [UILabel new];
        [_dialogLabel WY_SetFontSize:13 textColor:0xffffff];
        _dialogLabel.textAlignment = NSTextAlignmentCenter;
        _dialogLabel.numberOfLines = 0;
        _dialogLabel.text = @"加载中...";
        _dialogLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _dialogLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_dialogView addSubview:_dialogLabel];
        
        NSArray *constraints4 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=16)-[_dialogLabel]-(>=16)-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:NSDictionaryOfVariableBindings(_dialogLabel)];
        
        NSArray *constraints5 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-17-[_activity]-8-[_dialogLabel]-17-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:NSDictionaryOfVariableBindings(_activity,_dialogLabel)];
        
        [_dialogView addConstraints:constraints4];
        [_dialogView addConstraints:constraints5];
    
    [_dialogView addConstraint:[NSLayoutConstraint constraintWithItem:_dialogLabel
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:_dialogView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0]];
    
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
    [self addGestureRecognizer:tapGes];

}

-(void) tapScreen {
    [self hideLoading];
}

+(Loading *)sharedInstance {
    static Loading *loading = nil;
    @synchronized(self) {
        if (loading == nil) {
            loading = [[self alloc] init];
        }
    }
    return loading;
}


+(void)show:(NSString *)message isForce:(BOOL)isForce {
    [[Loading sharedInstance] show:message isForce:isForce];
}

+(void) hide {
    [[Loading sharedInstance] hideLoading];
}

-(void) show:(NSString *) msg isForce:(BOOL) isForce {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self createUI];
    });
    
    if (isForce == YES) {
        self.userInteractionEnabled = NO;
    }
    else
    {
        self.userInteractionEnabled = YES;
    }
    [_window makeKeyAndVisible];
    _window.hidden = NO;
    self.alpha = 0;
    self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    _dialogLabel.text = msg;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void) hideLoading {
    [_window resignKeyWindow];
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        _window.hidden = YES;
    }];
    
}

@end
