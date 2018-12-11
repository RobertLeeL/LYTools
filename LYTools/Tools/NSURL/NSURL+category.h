//
//  NSURL+category.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/11.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (category)


/**
 获取当前query的参数列表

 @return 参数列表 
 */
- (NSDictionary<NSString *, NSString *> *)tl_getQueryItem;

@end

NS_ASSUME_NONNULL_END
