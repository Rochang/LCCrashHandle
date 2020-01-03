//
//  NSMutableDictionary+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSMutableDictionary+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"

@implementation NSMutableDictionary (LCCrashHandle)

+ (void)lc_enableNSMutableDictionaryProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSDictionaryM = NSClassFromString(@"__NSDictionaryM");
        [__NSDictionaryM lc_instanceSwizzleMethod:@selector(setObject:forKeyedSubscript:) replaceMethod:@selector(lc_setObject:forKeyedSubscript:)];
        
        [__NSDictionaryM lc_instanceSwizzleMethod:@selector(removeObjectForKey:) replaceMethod:@selector(lc_removeObjectForKey:)];
    });
    
}

- (void)lc_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    @try {
        [self lc_setObject:obj forKeyedSubscript:key];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
        
    }
}

- (void)lc_removeObjectForKey:(id)aKey {
    @try {
        [self lc_removeObjectForKey:aKey];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
    }
}

@end
