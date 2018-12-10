//
//  NSArray+category.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/10.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (category)

///array -> json
- (NSString *)arrryToJsonString;

/// 数组去重
- (NSArray *)tl_distinctSameElements;

@end

NS_ASSUME_NONNULL_END
