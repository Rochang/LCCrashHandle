//
//  LCCrashHandleLog.h
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCCrashHandleLog : NSObject

+ (void)lc_logWithException:(NSException *)exception;

@end

NS_ASSUME_NONNULL_END
