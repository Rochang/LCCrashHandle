//
//  NSObject+LCSwizzle.h
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "LCCrashHandleLog.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCSwizzle)

/** 交换类方法 */
+ (void)lc_classSwizzleMethod:(SEL)originalSelector replaceMethod:(SEL)replaceSelector;

/** 交换对象方法 */
+ (void)lc_instanceSwizzleMethod:(SEL)originalSelector replaceMethod:(SEL)replaceSelector;

@end

NS_ASSUME_NONNULL_END
