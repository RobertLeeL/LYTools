//
//  UIView+LYToast.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/10.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LYToastCofigure;
@class LYToast;

#define LYToastTopPadding 44
#define LYToastBottonPadding 44

typedef NS_ENUM(NSInteger, LYToastPosition) {
    LYToastPositionTop = 1,
    LYToastPositionCenter = 0,
    LYToastPositionBottom = 2
};

@interface UIView (LYToast)



/**
 Toast默认在中间 默认时长1.5秒

 @param message message
 */
- (void)showToast:(NSString *)message;


/**
 Toast默认在中间

 @param message message
 @param duration duration
 */
- (void)showToast:(NSString *)message duration:(CGFloat)duration;


- (void)showToast:(nullable NSString *)title message:(NSString *)message duration:(CGFloat)duration;

/**
 设置Toast位置

 @param title 标题
 @param message message
 @param duration duration
 @param position 位置
 */
- (void)showToast:(nullable NSString *)title message: (NSString *)message duration:(CGFloat)duration position:(LYToastPosition)position;


/**
 初始化方法

 @param title 标题
 @param message 内容
 @param duration duration
 @param position 位置 默认中间
 @param cofigure 配置
 */
- (void)showToast:(NSString *)title message:(NSString *)message duration:(CGFloat)duration position:(LYToastPosition)position cofigure:(nullable LYToastCofigure *)cofigure;

- (void)hideToast;

@end


///配置Toast
@interface LYToastCofigure : NSObject

///显示时间，默认1.5秒
@property (nonatomic, assign) CGFloat duration;

/// 背景颜色 默认黑色
@property (nonatomic, strong) UIColor *backgroundColor;

/// 标题颜色 默认白色
@property (nonatomic, strong) UIColor *titleColor;

/// 内容字体颜色 默认白色
@property (nonatomic, strong) UIColor *messageColor;

/// 标题字体大小 默认16
@property (nonatomic, strong) UIFont *titleFont;

/// 内容字体大小 默认16
@property (nonatomic, strong) UIFont *messageFont;

/// 透明度 默认0.7
@property (nonatomic, assign) CGFloat alpha;

/// 最大宽度 0.8
@property (nonatomic, assign) CGFloat maxWidthPercentage;

/// 最大宽度 0.8
@property (nonatomic, assign) CGFloat maxHeightPercentage;

/// 圆角 默认 6.0
@property (nonatomic, assign) CGFloat cornerRadius;

/// 字体距离View垂直距离 inset 默认10
@property (nonatomic, assign) CGFloat horizontalPadding;

/// 字体距离View水平距离 inset 默认10
@property (nonatomic, assign) CGFloat verticalPadding;

/// 标题和message的距离 默认10
@property (nonatomic, assign) CGFloat titleMessagePadding;


- (instancetype)initWithDefaultStyle NS_DESIGNATED_INITIALIZER;


@end

///ToastView
@interface LYToast : UIView

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message;

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message cofigure:(nullable LYToastCofigure *)cofigure;

@end


NS_ASSUME_NONNULL_END
