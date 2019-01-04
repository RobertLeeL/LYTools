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
    if (!message) {
        return;
    }
    NSArray *subViewArray = self.subviews;
    for (UIView *subview in subViewArray) {
        if ([subview isKindOfClass:[LYToast class]]) {
            [subview removeFromSuperview];
        }
    }
    if (!cofigure) {
        cofigure = [[LYToastCofigure alloc] initWithDefaultStyle];
    }
    LYToast *toast = [[LYToast alloc] initWithTitle:title message:message cofigure:cofigure];
    
    
    
}

@end


@implementation LYToastCofigure

- (instancetype)initWithDefaultStyle {
    self = [super init];
    if (self) {
        self.duration = 1.5f;
        self.backgroundColor = [UIColor blackColor];
        self.titleColor = [UIColor whiteColor];
        self.messageColor = [UIColor whiteColor];
        self.titleFont = [UIFont systemFontOfSize:16];
        self.messageFont = [UIFont systemFontOfSize:14];
        self.alpha = 0.7f;
        self.maxWidthPercentage = 0.8f;
        self.maxHeightPercentage = 0.8f;
        self.cornerRadius = 6.0f;
        self.horizontalPadding = 10.0f;
        self.verticalPadding = 10.0f;
        self.titleMessagePadding = 10.0f;
    }
    return self;
}

@end

@interface LYToast()

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *message;

@property (nonatomic, strong) LYToastCofigure *cofig;

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
        self.backgroundColor = cofigure.backgroundColor;
        self.alpha = cofigure.alpha;
        if (title) {
            self.title = [[UILabel alloc] init];
            self.title.text = title;
            self.title.font = cofigure.titleFont;
            self.title.textColor = cofigure.titleColor;
            [self addSubview:self.title];
        }
        self.message = [[UILabel alloc] init];
        self.message.text = message;
        self.message.font = cofigure.messageFont;
        self.message.textColor = cofigure.messageColor;
        [self addSubview:self.message];
        self.cofig = cofigure;
        
        
    }
    return self;
}


@end
