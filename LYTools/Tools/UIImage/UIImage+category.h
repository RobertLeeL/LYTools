//
//  UIImage+category.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TLImageWaterLocation) {
    TLImageWaterLocationTopLeft,
    TLImageWaterLocationTopRight,
    TLImageWaterLocationBottomLeft,
    TLImageWaterLocationBottomRight,
    TLImageWaterLocationCenter
};

@interface UIImage (category)

/// 根据颜色生成一张图片
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  用颜色生成指定大小的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

///将图片裁剪到目标尺寸
- (UIImage *)tl_imageScalingToTargetSize:(CGSize)targetSize;


/**
 图片旋转角度

 @param degrees 角度
 @return 旋转完的角度
 */
- (UIImage *)tl_rotateImageByDegrees:(CGFloat)degrees;


/**
 图片添加文字水印  默认距离边距为10

 @param text 文字
 @param fontSize 文字大小
 @param color 文字颜色
 @param location 水印位置
 @return 加完水印的图
 */
- (UIImage *)tl_addWaterWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)color location:(TLImageWaterLocation)location;


/**
 图片添加图片水印  默认距离边距为10

 @param image 水印图片
 @param waterSize 水印大小
 @param location 位置
 @return 加完水印后的图片
 */
- (UIImage *)tl_addWaterWithImage:(UIImage *)image waterImageSize:(CGSize)waterSize location:(TLImageWaterLocation)location;

@end

NS_ASSUME_NONNULL_END
