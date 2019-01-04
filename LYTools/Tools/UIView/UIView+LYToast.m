//
//  UIView+LYToast.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/10.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "UIView+LYToast.h"

@implementation UIView (LYToast)

- (void)showToast:(NSString *)message {
    [self showToast:message duration:0];
}

- (void)showToast:(NSString *)message duration:(CGFloat)duration {
    [self showToast:nil message:message duration:duration];
}

- (void)showToast:(NSString *)title message:(NSString *)message duration:(CGFloat)duration {
    [self showToast:title message:message duration:duration position:LYToastPositionCenter];
}

- (void)showToast:(NSString *)title message:(NSString *)message duration:(CGFloat)duration position:(LYToastPosition)position {
    [self showToast:title message:message duration:duration position:position cofigure:nil];
}

- (void)showToast:(NSString *)title message:(NSString *)message duration:(CGFloat)duration position:(LYToastPosition)position cofigure:(LYToastCofigure *)cofigure {
    
}

@end


@implementation LYToastCofigure

- (instancetype)initWithDefaultStyle {
    self = [super init];
    if (self) {
        self.duration = 1.5;
        self.backgroundColor = [UIColor blackColor];
        self.titleColor = [UIColor whiteColor];
    }
    return self;
}

@end

@interface LYToast()

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *message;

@end

@implementation LYToast

- (instancetype)initWithTitle:(NSString *)title {
    return [self initWithTitle:title message:nil cofigure:nil];
}

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message {
    return [self initWithTitle:title message:message cofigure:nil];
}

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message cofigure:(nullable LYToastCofigure *)cofigure {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
