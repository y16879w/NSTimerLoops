//
//  LymWeakTarget.h
//  NSTimerLoop
//
//  Created by 李艳敏 on 2018/12/22.
//  Copyright © 2018年 李艳敏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LymWeakTarget : NSObject
+(instancetype)proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
