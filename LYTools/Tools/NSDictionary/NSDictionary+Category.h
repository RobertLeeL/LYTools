//
//  NSDictionary+Category.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/18.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Category)

///dict -> json
- (NSString *)tl_jsonString;

/// jsonData -> dict
+ (instancetype)tl_dictionaryWithJsonData:(NSData *)jsonData;

/// jsonString -> dict
+ (instancetype)tl_dictionaryWithJsonString:(NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
