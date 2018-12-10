//
//  NSArray+category.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/10.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "NSArray+category.h"

@implementation NSArray (category)

- (NSString *)arrryToJsonString {
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

- (NSArray *)tl_distinctSameElements {
    NSMutableOrderedSet *set = [NSMutableOrderedSet orderedSetWithArray:self];
    return [set array];
}

@end
