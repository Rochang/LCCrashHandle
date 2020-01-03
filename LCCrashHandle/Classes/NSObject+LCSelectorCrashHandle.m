//
//  NSObject+LCSelectorCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSObject+LCSelectorCrashHandle.h"
#import "NSObject+LCSwizzle.h"
#import "LCCrashHandleLog.h"

/**
    消息转发过程:
    +(BOOL)resolveInstanceMethod:(SEL)sel;
    +(BOOL)resolveClassMethod:(SEL)sel;
    - (id)forwardingTargetForSelector:(SEL)aSelector;
    - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector;
    - (void)forwardInvocation:(NSInvocation *)anInvocation;
 */

static NSString *_errorFunctionName;
void dynamicMethodIMP(id self,SEL _cmd){
    NSString *reason = [NSString stringWithFormat:@"%@ 没有对象方法:%@, 已处理", NSStringFromClass([self class]), _errorFunctionName];
    NSException *exception = [NSException exceptionWithName:@"" reason:reason userInfo:@{}];
    [LCCrashHandleLog lc_logWithException:exception];
}

@implementation NSObject (LCSelectorCrashHandle)

+ (void)lc_enableSelectorProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self lc_instanceSwizzleMethod:@selector(methodSignatureForSelector:) replaceMethod:@selector(lc_methodSignatureForSelector:)];

        [self lc_instanceSwizzleMethod:@selector(forwardInvocation:) replaceMethod:@selector(lc_forwardInvocation:)];
    });
}

- (NSMethodSignature *)lc_methodSignatureForSelector:(SEL)aSelector{
    if (![self respondsToSelector:aSelector]) {
        _errorFunctionName = NSStringFromSelector(aSelector);
        NSMethodSignature *methodSignature = [self lc_methodSignatureForSelector:aSelector];
        if (class_addMethod([self class], aSelector, (IMP)dynamicMethodIMP, "v@:")) {
            NSLog(@"添加临时方法");
        }
        if (!methodSignature) {
            methodSignature = [self lc_methodSignatureForSelector:aSelector];
        }

        return methodSignature;

    }else{
        return [self lc_methodSignatureForSelector:aSelector];
    }
}

- (void)lc_forwardInvocation:(NSInvocation *)anInvocation{
    SEL selector = [anInvocation selector];
    if ([self respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:self];
    }else{
        [self lc_forwardInvocation:anInvocation];
    }
}


@end
