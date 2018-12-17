//
//  NSDictionary+Category.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/18.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

- (NSString *)tl_jsonString {
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    if (error)
        return nil;
    
    NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

+ (instancetype)tl_dictionaryWithJsonData:(NSData *)jsonData {
    NSError * error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData
                                             options:NSJSONReadingAllowFragments
                                               error:&error];
    if (!error && [obj isKindOfClass:[NSDictionary class]]) {
        return obj;
    }
    return nil;
}

+ (instancetype)tl_dictionaryWithJsonString:(NSString *)jsonString {
    NSData * data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [NSDictionary tl_dictionaryWithJsonData:data];
}

@end
