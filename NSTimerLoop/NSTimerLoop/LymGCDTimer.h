//
//  LymGCDTimer.h
//  NSTimerLoop
//
//  Created by 李艳敏 on 2018/12/22.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LymGCDTimer : NSObject
#pragma mark - 类方法初始化，queue如果是nil则用defaultPriority优先级的并发队列
+ (instancetype)scheduledDispatchTimerWithName:(NSString *)timerName
                                  timeInterval:(NSTimeInterval)interval
                                         queue:(dispatch_queue_t)queue
                                       repeats:(BOOL)repeats
                                        action:(dispatch_block_t)action;

- (void)cancelTimerWithName:(NSString *)timerName;
@end

NS_ASSUME_NONNULL_END
