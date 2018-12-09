//
//  UIImage+category.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "UIImage+category.h"

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

@end
