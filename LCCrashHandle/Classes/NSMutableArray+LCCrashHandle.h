//
//  NSMutableArray+LCCrashHandle.h
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (LCCrashHandle)

+ (void)lc_enableNSMutableArrayProtector;

@end

NS_ASSUME_NONNULL_END
