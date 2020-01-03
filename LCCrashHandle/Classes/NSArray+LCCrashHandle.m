//
//  NSArray+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSArray+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"
#import "LCCrashHandleLog.h"

@implementation NSArray (LCCrashHandle)

+ (void)lc_enableArrayProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSArray = objc_getClass("NSArray");
        Class __NSArrayI = objc_getClass("__NSArrayI");
        Class __NSSingleObjectArrayI = objc_getClass("__NSSingleObjectArrayI");
        Class __NSArray0 = objc_getClass("__NSArray0");
        Class __NSPlaceholderArray = objc_getClass("__NSPlaceholderArray");
        
        // 交换方法
        [__NSPlaceholderArray lc_instanceSwizzleMethod:@selector(initWithObjects:count:) replaceMethod:@selector(lc_initWithObjects:count:)];
        
        [__NSArray lc_classSwizzleMethod:@selector(arrayWithObjects:count:) replaceMethod:@selector(lc_arrayWithObjects:count:)];
        
        /* 数组count >= 2 */
        [__NSArrayI lc_instanceSwizzleMethod:@selector(objectAtIndex:) replaceMethod:@selector(lc_objectAtIndex:)];//[arr objectAtIndex:];
        
        [__NSArrayI lc_instanceSwizzleMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(lc_objectAtIndexedSubscript:)];//arr[];
        
        [__NSArrayI lc_instanceSwizzleMethod:@selector(getObjects:range:) replaceMethod:@selector(lc_getObjectsNSArray:range:)];
        
        /* 数组为空 */
        [__NSArray0 lc_instanceSwizzleMethod:@selector(objectAtIndex:) replaceMethod:@selector(lc_objectAtIndexedNullarray:)];
        
        /* 数组count == 1 */
        [__NSSingleObjectArrayI lc_instanceSwizzleMethod:@selector(objectAtIndex:) replaceMethod:@selector(lc_objectAtIndexedArrayCountOnlyOne:)];
        
        // objectsAtIndexes:
        [__NSArray lc_instanceSwizzleMethod:@selector(objectsAtIndexes:) replaceMethod:@selector(lc_objectsAtIndexes:)];
    });
}

#pragma mark - private method

+ (instancetype)lc_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    id instance = nil;
    @try {
        instance = [self lc_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];

        // 过滤nil
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self lc_arrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}

- (instancetype)lc_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt {
    id instance = nil;
    @try {
        instance = [self lc_initWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];

        // 过滤nil
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self lc_initWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}

- (id)lc_objectAtIndex:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self lc_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
        return object;
    }
}

- (id)lc_objectAtIndexedSubscript:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self lc_objectAtIndexedSubscript:index];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
        return object;
    }
}

- (id)lc_objectAtIndexedNullarray:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self lc_objectAtIndexedNullarray:index];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
        return object;
    }
}

- (id)lc_objectAtIndexedArrayCountOnlyOne:(NSUInteger)index {
    id object = nil;
    @try {
        object = [self lc_objectAtIndexedArrayCountOnlyOne:index];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
        return object;
    }
}

- (NSArray *)lc_objectsAtIndexes:(NSIndexSet *)indexes {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self lc_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
        return returnArray;
    }
}

#pragma mark getObjects:range:
- (void)lc_getObjectsNSArray:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self lc_getObjectsNSArray:objects range:range];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
    }
}

- (void)lc_getObjectsNSSingleObjectArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self lc_getObjectsNSSingleObjectArrayI:objects range:range];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
        
    }
}

- (void)lc_getObjectsNSArrayI:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self lc_getObjectsNSArrayI:objects range:range];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
        
    }
}



@end
