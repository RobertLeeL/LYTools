//
//  UIImage+category.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (category)

/// 根据颜色生成一张图片
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  用颜色生成指定大小的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
