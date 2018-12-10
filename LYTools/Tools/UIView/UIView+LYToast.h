//
//  UIView+LYToast.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/10.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

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
- (void)showToast:(NSString *)message duration:(NSTimeInterval)duration;



/**
 设置Toast位置

 @param message message
 @param duration duration
 @param point 位置
 */
- (void)showToast:(NSString *)message duration:(NSTimeInterval)duration point:(CGPoint)point;

@end


///配置Toast
@interface LYToastCofigure : NSObject

@end

///ToastView
@interface LYToast : UIView

@end


NS_ASSUME_NONNULL_END
