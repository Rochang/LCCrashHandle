//
//  NSObject+LCSwizzle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSObject+LCSwizzle.h"

@implementation NSObject (LCSwizzle)

/** 交换类方法 */
+ (void)lc_classSwizzleMethod:(SEL)originalSelector replaceMethod:(SEL)replaceSelector {
    Class class = [self class];
    Method origMethod = class_getClassMethod(class, originalSelector);
    if (!origMethod) {
        NSLog(@"找不到源方法 : %@", NSStringFromSelector(originalSelector));
        return;
    }
    Method replaceMeathod = class_getClassMethod(class, replaceSelector);
    
    // class_addMethod:如果发现方法已经存在，会失败返回
    // 如果方法没有存在,添加被替换的方法的实现
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(replaceMeathod), method_getTypeEncoding(replaceMeathod));
    if (didAddMethod) {
        // 原方法未实现，则替换原方法防止crash
        class_replaceMethod(class, replaceSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else {
        // 添加失败：说明源方法已经有实现，交换方法
        method_exchangeImplementations(origMethod, replaceMeathod);
    }
}

/** 交换对象方法 */
+ (void)lc_instanceSwizzleMethod:(SEL)originalSelector replaceMethod:(SEL)replaceSelector {
    Class class = [self class];
    Method origMethod = class_getInstanceMethod(class, originalSelector);
    Method replaceMeathod = class_getInstanceMethod(class, replaceSelector);
    
    // class_addMethod:如果发现方法已经存在，会失败返回
    // 如果方法没有存在,添加被替换的方法的实现
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(replaceMeathod), method_getTypeEncoding(replaceMeathod));
    if (didAddMethod) {
        // 原方法未实现，则替换原方法防止crash
        class_replaceMethod(class, replaceSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else {
        // 添加失败：说明源方法已经有实现，交换方法
        method_exchangeImplementations(origMethod, replaceMeathod);
    }
}

@end
