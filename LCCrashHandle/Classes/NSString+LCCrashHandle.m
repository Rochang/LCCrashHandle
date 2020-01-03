//
//  NSString+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSString+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"

@implementation NSString (LCCrashHandle)

+ (void)lc_enableNSStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSCFConstantString = NSClassFromString(@"__NSCFConstantString");
        
        [__NSCFConstantString lc_instanceSwizzleMethod:@selector(substringToIndex:) replaceMethod:@selector(lc_substringToIndex:)];
        
        [__NSCFConstantString lc_instanceSwizzleMethod:@selector(substringFromIndex:) replaceMethod:@selector(lc_substringFromIndex:)];
        
        [__NSCFConstantString lc_instanceSwizzleMethod:@selector(substringWithRange:) replaceMethod:@selector(lc_substringWithRange:)];
        
        [__NSCFConstantString lc_instanceSwizzleMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) replaceMethod:@selector(lc_stringByReplacingOccurrencesOfString:withString:options:range:)];
    });
    
}

- (NSString *)lc_substringFromIndex:(NSUInteger)from {
    NSString *subString = nil;
    @try {
        subString = [self lc_substringFromIndex:from];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

- (NSString *)lc_substringToIndex:(NSUInteger)index {
    NSString *subString = nil;
    @try {
        subString = [self lc_substringToIndex:index];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        subString = nil;
    }
    @finally {
        return subString;
    }
}

- (NSString *)lc_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self lc_stringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

- (NSString *)lc_stringByReplacingOccurrencesOfString:(NSRange)range withString:(NSString *)replacement {
    NSString *newStr = nil;
    @try {
        newStr = [self lc_stringByReplacingOccurrencesOfString:range withString:replacement];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

- (NSString *)lc_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    NSString *newStr = nil;
    @try {
        newStr = [self lc_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

- (NSString *)lc_substringWithRange:(NSRange)range {
    NSString *subString = nil;
    @try {
        subString = [self lc_substringWithRange:range];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        subString = nil;
    }
    @finally {
        return subString;
    }
}


@end
