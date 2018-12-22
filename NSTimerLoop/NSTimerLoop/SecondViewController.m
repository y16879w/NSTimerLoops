//
//  SecondViewController.m
//  NSTimerLoop
//
//  Created by 李艳敏 on 2018/12/22.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import "SecondViewController.h"
#import "NSTimer+LymTimerBlock.h"
#import "LymWeakTarget.h"
#import "LymGCDTimer.h"
@interface SecondViewController ()
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, strong)LymGCDTimer *gcdtimer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    // 一、消息转发
    /**
     通过使用NSProxy类，消息转发的接口，改变实例方法doSomeThing的调用者.
     综合上述所说，NSTime 势必持有 JZWeakProx 实例对象, 然后结合消息转发，改变实例方法的调用者，从而实现 Controller 调用实例方法，JZWeakProxy 实例对象又不强引用 Controller实例，那么 Controller实例 能够正常释放。
     */
//        _timer = [NSTimer timerWithTimeInterval:1 target:[LymWeakTarget proxyWithTarget:self] selector:@selector(doSometing) userInfo:nil repeats:YES];
//        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
     // 二、Block
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"========");
//    }];
    
    
    //三、CGD Timer
    _gcdtimer = [LymGCDTimer scheduledDispatchTimerWithName:@"myTime"
                                                     timeInterval:1
                                                            queue:dispatch_get_main_queue()
                                                          repeats:YES
                                                           action:^{
                                                               NSLog(@"GCDTimer");
                                                           }];
  
}
- (void)doSometing {
    NSLog(@"========");
}

- (void)dealloc {
//    [_timer invalidate];
//    _timer = nil;
//    NSLog(@"%s",__func__);
    
    [_gcdtimer cancelTimerWithName:@"myTime"];
    
    
}

@end
