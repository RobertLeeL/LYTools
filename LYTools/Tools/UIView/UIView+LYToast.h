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

@interface UIView (LYToast)



/**
 Toast默认在中间 默认时长2秒

 @param message message
 */
- (void)showToast:(NSString *)message;


/**
 Toast默认在中间

 @param message message
 @param duration duration
 */
- (void)showToast:(NSString *)message duration:(CGFloat)duration;



/**
 设置Toast位置

 @param message message
 @param duration duration
 @param position 位置
 */
- (void)showToast:(NSString *)message duration:(CGFloat)duration position:(CGPoint)position;


- (void)showToast:(NSString *)message duration:(CGFloat)duration position:(CGPoint)position cofigure:(LYToastCofigure *)cofigure;

- (void)hideToast;

- (void)hideToast:(LYToast *)toast;

- (void)hideAllToasts;

- (void)clearToastQueue;

@end


///配置Toast
@interface LYToastCofigure : NSObject

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) UIColor *messageColor;

@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIFont *messageFont;

@property (nonatomic, assign) CGFloat alpha;

@property (nonatomic, assign) CGFloat minWidthPercentage;

@property (nonatomic, assign) CGFloat maxHeightPercentage;

@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, assign) CGFloat horizontalPadding;

@property (nonatomic, assign) CGFloat verticalPadding;

@property (nonatomic, assign) CGSize imageSize;

@property (nonatomic, assign) BOOL queueEnabled;

@end

///ToastView
@interface LYToast : UIView

- (instancetype)initWithTitle:(NSString *)title;

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message;

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message image:(nullable UIImage *)image;

- (instancetype)initWithTitle:(NSString *)title message:(nullable NSString *)message image:(nullable UIImage *)image cofigure:(nullable LYToastCofigure *)cofigure;

@end


NS_ASSUME_NONNULL_END
