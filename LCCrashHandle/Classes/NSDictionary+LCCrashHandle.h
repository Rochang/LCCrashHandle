//
//  NSDictionary+LCCrashHandle.h
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (LCCrashHandle)

+ (void)lc_enableNSDictionaryProtector;

@end

NS_ASSUME_NONNULL_END
