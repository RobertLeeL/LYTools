//
//  UIView+LYToast.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/10.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "UIView+LYToast.h"

@implementation UIView (LYToast)

@end


@implementation LYToastCofigure



@end

@implementation LYToast

- (instancetype)initWithTitle:(NSString *)title {
    return [self initWithTitle:title message:nil];
}

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message {
    return [self initWithTitle:title message:message image:nil];
}

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message image:(nullable UIImage *)image {
    return [self initWithTitle:title message:message image:image cofigure:nil];
}

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message image:(nullable UIImage *)image cofigure:(nullable LYToastCofigure *)cofigure {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
