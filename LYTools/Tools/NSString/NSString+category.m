//
//  NSString+category.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "NSString+category.h"

@implementation NSString (category)

- (NSDate *)dateFromString {
    NSDateFormatter *dateFormatter =  [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

+ (NSString *)settingSecretStringWithPhoneNumber:(NSString *)phoneNumber {
    if (phoneNumber.length==11) {
        NSMutableString *newStr = [NSMutableString stringWithString:phoneNumber];
        NSRange range = NSMakeRange(3, 7);
        [newStr replaceCharactersInRange:range withString:@"****"];
        return newStr;
    }
    return nil;
}

- (NSArray *)tl_stringToArray {
    if (!self.length) {
        return nil;
    }
    
    NSMutableArray<NSString *> *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < self.length; i++) {
        NSString *stringItem = [self substringWithRange:NSMakeRange(i, 1)];
        [array addObject:stringItem];
    }
    return [array copy];
}

- (NSString *)tl_deleteStringAllBlank {
    return [self stringByReplacingOccurrencesOfString:@"\\s" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

@end
