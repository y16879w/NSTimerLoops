//
//  LymGCDTimer.m
//  NSTimerLoop
//
//  Created by 李艳敏 on 2018/12/22.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import "LymGCDTimer.h"

@interface LymGCDTimer()
@property (nonatomic, strong)NSMutableDictionary *timerContainer;
@end
@implementation LymGCDTimer
- (instancetype)init {
    self = [super init];
    if (self) {
        self.timerContainer = [NSMutableDictionary new];
    }
    return self;
}
+ (instancetype)scheduledDispatchTimerWithName:(NSString *)timerName timeInterval:(NSTimeInterval)interval queue:(dispatch_queue_t)queue repeats:(BOOL)repeats action:(dispatch_block_t)action {
    NSParameterAssert(timerName);
    LymGCDTimer *gcdTimer = [[LymGCDTimer alloc]init];
    if (!queue) {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    dispatch_source_t timer = [gcdTimer.timerContainer objectForKey:timerName];
    if (!timer) {
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        [gcdTimer.timerContainer setObject:timer forKey:timerName];
        dispatch_resume(timer);
    }
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, interval * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    __weak LymGCDTimer *weakTimer = gcdTimer;
    dispatch_source_set_event_handler(timer, ^{
        action();
        if (!repeats) {
            [weakTimer cancelTimerWithName:timerName];
        }
    });
    return gcdTimer;
}

- (void)cancelTimerWithName:(NSString *)timerName {
    dispatch_source_t timer = [self.timerContainer objectForKey:timerName];
    if (!timer) {
        return;
    }
    [self.timerContainer removeObjectForKey:timerName];
    dispatch_source_cancel(timer);
}
@end
