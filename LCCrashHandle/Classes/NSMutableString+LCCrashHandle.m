//
//  NSMutableString+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSMutableString+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"

@implementation NSMutableString (LCCrashHandle)

+ (void)lc_enableNSMutableStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSCFString = NSClassFromString(@"__NSCFString");
        
        [__NSCFString lc_instanceSwizzleMethod:@selector(insertString:atIndex:) replaceMethod:@selector(lc_insertString:atIndex:)];
        
        [__NSCFString lc_instanceSwizzleMethod:@selector(deleteCharactersInRange:) replaceMethod:@selector(lc_deleteCharactersInRange:)];
        
        [__NSCFString lc_instanceSwizzleMethod:@selector(replaceCharactersInRange:withString:) replaceMethod:@selector(lc_replaceCharactersInRange:withString:)];
    });
}

- (void)lc_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    @try {
        [self lc_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
    }
}

- (void)lc_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    @try {
        [self lc_insertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
    }
}

- (void)lc_deleteCharactersInRange:(NSRange)range {
    @try {
        [self lc_deleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
    }
}

@end
