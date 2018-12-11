//
//  NSURL+category.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/11.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "NSURL+category.h"

@implementation NSURL (category)

- (NSDictionary<NSString *, NSString *> *)tl_getQueryItem {
    if (!self.absoluteString.length) {
        return nil;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:self.absoluteString];
    
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.name) {
            [params setObject:obj.value ?: [NSNull null] forKey:obj.name];
        }
    }];
    return [params copy];
}

@end
