//
//  NSAttributedString+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSAttributedString+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"

@implementation NSAttributedString (LCCrashHandle)

+ (void)lc_enableNSAttributedStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        [NSConcreteAttributedString lc_instanceSwizzleMethod:@selector(initWithString:) replaceMethod:@selector(lc_initWithString:)];
    });
}

- (instancetype)lc_initWithString:(NSString *)str {
    id object = nil;
    @try {
        object = [self lc_initWithString:str];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
        return object;
    }
}

//- (instancetype)lc_initWithAttributedString:(NSAttributedString *)attrStr {
//    id object = nil;
//    @try {
//        object = [self lc_initWithAttributedString:attrStr];
//    }
//    @catch (NSException *exception) {
//        [LCCrashHandleLog lc_logWithException:exception];
//    }
//    @finally {
//        return object;
//    }
//}
//
//- (instancetype)lc_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs {
//    id object = nil;
//    @try {
//        object = [self lc_initWithString:str attributes:attrs];
//    }
//    @catch (NSException *exception) {
//        [LCCrashHandleLog lc_logWithException:exception];
//    }
//    @finally {
//        return object;
//    }
//}

@end
