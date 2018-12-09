//
//  ViewController.m
//  LYTools
//
//  Created by 李龙跃 on 2018/12/9.
//  Copyright © 2018 Longyue Li. All rights reserved.
//

#import "ViewController.h"
#import "Tools/NSString/NSString+category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *string = @"2018-12-09 12:20:30";
    NSDate *date =  [string dateFromString];
    NSLog(@"%@",date);
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
