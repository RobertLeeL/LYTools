//
//  UIView+Draggable.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/12.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

///拖拽UIView然后在回弹回去 github上看的感觉很好玩。
//地址： https://github.com/KeymonWong/AnimationDragView
///UIDynamicAnimator这个类有时间得好好研究一下

@interface UIView (Draggable)

- (void)makeDraggable;

- (void)makeDraggableInView:(UIView *)view damping:(CGFloat)damping;

- (void)removeDraggable;

- (void)updateSnapPoint;

@end

NS_ASSUME_NONNULL_END
