//
//  NSArray+LCCrashHandle.h
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LCCrashHandle)

+ (void)lc_enableArrayProtector;

@end

NS_ASSUME_NONNULL_END
