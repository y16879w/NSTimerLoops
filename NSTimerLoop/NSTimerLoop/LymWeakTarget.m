//
//  LymWeakTarget.m
//  NSTimerLoop
//
//  Created by 李艳敏 on 2018/12/22.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import "LymWeakTarget.h"

@interface LymWeakTarget ()
@property (nonatomic, weak, readonly)id target;
@end

@implementation LymWeakTarget

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

+(instancetype)proxyWithTarget:(id)target {
    return [[self alloc]initWithTarget:target];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = [anInvocation selector];
    if ([self.target respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:self.target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSAssert(self.target, @"目前对象失效，NSTimer必须c注销");
    return [self.target methodSignatureForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.target respondsToSelector:aSelector];
}

@end
