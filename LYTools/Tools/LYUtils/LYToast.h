//
//  LYToast.h
//  LYTools
//
//  Created by 李龙跃 on 2018/12/10.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

///TODO:自动获取最上层ViewController

@interface LYToast : UIView

- (void)tl_showToast:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
