//
//  ViewController.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "ViewController.h"
#import "Tools/NSString/NSString+category.h"
#import "Tools/UIView/UIView+LYToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *string = @"2018-12-09 12:20:30";
    NSDate *date =  [string dateFromString];
    NSLog(@"%@",date);
    
    [self.view showToast:@"你好"];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
