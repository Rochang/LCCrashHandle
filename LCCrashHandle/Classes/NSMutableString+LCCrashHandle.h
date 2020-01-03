//
//  NSMutableString+LCCrashHandle.h
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableString (LCCrashHandle)

+ (void)lc_enableNSMutableStringProtector;

@end

NS_ASSUME_NONNULL_END
