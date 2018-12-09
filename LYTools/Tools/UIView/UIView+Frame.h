//
//  UIView+Frame.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

/// The left of View
- (CGFloat)left;

///The right of View
- (CGFloat)right;

///The size of View
- (CGSize)size;

///The top of View
- (CGFloat)top;

///------
- (CGFloat)bottom;

///------
- (CGFloat)width;

///------
- (CGFloat)height;

///------
- (CGFloat)centerX;

///------
- (CGFloat)centerY;

///------
- (CGFloat)maxX;

///------
- (CGFloat)maxY;

- (void)setLeft:(CGFloat)left;
- (void)setRight:(CGFloat)right;
- (void)setSize:(CGSize)size;
- (void)setTop:(CGFloat)top;
- (void)setBottom:(CGFloat)bottom;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)setOrigin:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
