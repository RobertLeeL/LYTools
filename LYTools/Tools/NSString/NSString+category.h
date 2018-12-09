//
//  NSString+category.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (category)

///string To date
- (NSDate *)dateFromString;

///隐藏电话号码中间四位
+ (NSString *)settingSecretStringWithPhoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
