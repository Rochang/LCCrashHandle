//
//  NSObject+LCSelectorCrashHandle.h
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCSelectorCrashHandle)

+ (void)lc_enableSelectorProtector;

@end

NS_ASSUME_NONNULL_END
