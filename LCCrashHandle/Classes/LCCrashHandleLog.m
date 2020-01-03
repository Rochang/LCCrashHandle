//
//  LCCrashHandleLog.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/27.
//

#import "LCCrashHandleLog.h"

@implementation LCCrashHandleLog

+ (void)lc_logWithException:(NSException *)exception {
    NSArray<NSString *> *callStackSymbols = [NSThread callStackSymbols];
    if (callStackSymbols.count > 15) {
         callStackSymbols = [callStackSymbols subarrayWithRange:NSMakeRange(0, 15)];
    }
    NSLog(@"\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> LCCrashHandle <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< \n\n>>>>> [crash reason] : %@\n>>>>> [callStackSymbols] :\n%@\n >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> LCCrashHandle <<<<<<<<<<<<<<<<<<<<<<<<<<<<<< \n",exception.reason, callStackSymbols);
}

@end
