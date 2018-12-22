//
//  ViewController.m
//  NSTimerLoop
//
//  Created by 李艳敏 on 2018/12/22.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
 
}

- (void)btnClick:(UIButton *)btn {
    SecondViewController *vc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
