//
//  UIImage+category.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "UIImage+category.h"

#define kImageWaterMarginX 10
#define kImageWaterMarginY 10

@implementation UIImage (category)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData* imageData = UIImageJPEGRepresentation(image, 1.0f);
    image = [UIImage imageWithData:imageData];
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)tl_imageScalingToTargetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [self drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) {
        NSLog(@"error to scale image");
    }
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)tl_rotateImageByDegrees:(CGFloat)degrees; {
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    CGSize rotatedSize;
    
    rotatedSize.width = width;
    rotatedSize.height = height;
    
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);
    CGContextRotateCTM(bitmap, M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)tl_addWaterWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)color location:(TLImageWaterLocation)location {
    CGSize size = self.size;
    
    CGRect rect = (CGRect){CGPointZero,size};
    
    //新建图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //绘制图片
    [self drawInRect:rect];
    
    //绘制文本
    NSDictionary *attr =@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:color};
    
    CGRect strRect = [self tl_calculateWidth:text attr:attr location:location rect:rect];
    
    [text drawInRect:strRect withAttributes:attr];
    
    //获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (UIImage *)tl_addWaterWithImage:(UIImage *)image waterImageSize:(CGSize)waterSize location:(TLImageWaterLocation)location {
    CGSize size = self.size;
    
    CGRect rect = (CGRect){CGPointZero,size};
    
    //新建图片图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //绘制图片
    [self drawInRect:rect];
    
    //计算水印的rect
    CGSize waterImageSize = CGSizeEqualToSize(waterSize, CGSizeZero)?image.size:waterSize;
    CGRect calRect = [self tl_rectWithRect:rect size:waterImageSize location:location];
    
    //绘制水印图片
    [image drawInRect:calRect];
    
    //获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束图片图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark- private Method
/**
 计算水印位置

 @param text 水印文字
 @param attr 字符串属性
 @param location 位置
 @param rect 图片rect
 @return rect
 */
- (CGRect)tl_calculateWidth:(NSString *)text attr:(NSDictionary *)attr location:(TLImageWaterLocation)location rect:(CGRect)rect {
     CGSize size =  [text sizeWithAttributes:attr];
    CGRect calRect = [self tl_rectWithRect:rect size:size location:location];
    return calRect;
}

- (CGRect)tl_rectWithRect:(CGRect)rect size:(CGSize)size location:(TLImageWaterLocation)location {
    CGPoint point = CGPointZero;
    //右上
    if(TLImageWaterLocationTopRight == location){
        point = CGPointMake(rect.size.width - size.width - kImageWaterMarginX, kImageWaterMarginY);
    }
    //左下
    if(TLImageWaterLocationBottomLeft == location) {
        point = CGPointMake(kImageWaterMarginX, rect.size.height - size.height - kImageWaterMarginY);
    }
    //右下
    if(TLImageWaterLocationBottomRight == location) {
        point = CGPointMake(rect.size.width - size.width - kImageWaterMarginX, rect.size.height - size.height - kImageWaterMarginY);
    }
    //左上
    if (TLImageWaterLocationTopLeft == location) {
    }
    //正中
    if(TLImageWaterLocationCenter == location){
        point = CGPointMake((rect.size.width - size.width)*.5f, (rect.size.height - size.height)*.5f);
    }
    CGRect calRect = (CGRect){point,size};
    
    return calRect;
}

@end
