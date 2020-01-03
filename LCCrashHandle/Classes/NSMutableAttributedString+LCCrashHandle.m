//
//  NSMutableAttributedString+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSMutableAttributedString+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"

@implementation NSMutableAttributedString (LCCrashHandle)

+ (void)lc_enableNSMutableAttributedStringProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class NSConcreteMutableAttributedString = NSClassFromString(@"NSConcreteMutableAttributedString");
    
        [NSConcreteMutableAttributedString lc_instanceSwizzleMethod:@selector(initWithString:) replaceMethod:@selector(lc_initWithString:)];
        
        [NSConcreteMutableAttributedString lc_instanceSwizzleMethod:@selector(initWithString:attributes:) replaceMethod:@selector(lc_initWithString:attributes:)];
        
    });
}

- (instancetype)lc_initWithString:(NSString *)str {
    id object = nil;
    @try {
        object = [self lc_initWithString:str];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
        return object;
    }
}

- (instancetype)lc_initWithString:(NSString *)str attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs {
    id object = nil;
    @try {
        object = [self lc_initWithString:str attributes:attrs];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
        return object;
    }
}
@end
