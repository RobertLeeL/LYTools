//
//  UIColor+category.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (category)

///随机色
+ (UIColor *)RandomColor;

///默认alpha = 1
+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
