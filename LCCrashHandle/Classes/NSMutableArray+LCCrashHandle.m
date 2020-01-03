//
//  NSMutableArray+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSMutableArray+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"

@implementation NSMutableArray (LCCrashHandle)

+ (void)lc_enableNSMutableArrayProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSArrayM = objc_getClass("__NSArrayM");
        // objectAtIndex:
        [__NSArrayM lc_instanceSwizzleMethod:@selector(objectAtIndex:) replaceMethod:@selector(lc_objectAtIndex:)];
        
        [__NSArrayM lc_instanceSwizzleMethod:@selector(objectAtIndexedSubscript:) replaceMethod:@selector(lc_objectAtIndexedSubscript:)];

        //insertObject:atIndex:
        [__NSArrayM lc_instanceSwizzleMethod:@selector(insertObject:atIndex:) replaceMethod:@selector(lc_insertObject:atIndex:)];

        //removeObjectAtIndex:
        [__NSArrayM lc_instanceSwizzleMethod:@selector(removeObjectAtIndex:) replaceMethod:@selector(lc_removeObjectAtIndex:)];

        //setObject:atIndexedSubscript:
        [__NSArrayM lc_instanceSwizzleMethod:@selector(setObject:atIndexedSubscript:) replaceMethod:@selector(lc_setObject:atIndexedSubscript:)];

        [__NSArrayM lc_instanceSwizzleMethod:@selector(getObjects:range:) replaceMethod:@selector(lc_getObjects:range:)];

    });
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

- (void)lc_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self lc_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
    }
}

- (void)lc_removeObjectAtIndex:(NSUInteger)index {
    @try {
        [self lc_removeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
    }
}

- (void)lc_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    @try {
        [self lc_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
    }
}

- (void)lc_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self lc_getObjects:objects range:range];
    } @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
    } @finally {
        
    }
}

@end
