//
//  NSDictionary+LCCrashHandle.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/26.
//

#import "NSDictionary+LCCrashHandle.h"
#import "NSObject+LCSwizzle.h"

// [<__NSDictionary0 0x7fff8061ff80> setValue:forUndefinedKey:] 可以重写方法forUndefinedKey, 目前防崩溃做了处理
// -[__NSDictionary0 setValue:forKey:]

@implementation NSDictionary (LCCrashHandle)

+ (void)lc_enableNSDictionaryProtector {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSPlaceholderDictionary = objc_getClass("__NSPlaceholderDictionary");
        Class __NSDictionary0 = objc_getClass("__NSDictionary0");
        
        [__NSPlaceholderDictionary lc_instanceSwizzleMethod:@selector(initWithObjects:forKeys:count:) replaceMethod:@selector(lc_initWithObjects:forKeys:count:)];
        
        [self lc_instanceSwizzleMethod:@selector(initWithObjects:forKeys:) replaceMethod:@selector(lc_initWithObjects:forKeys:)];
        
        [__NSDictionary0 lc_instanceSwizzleMethod:@selector(setValue:forKey:) replaceMethod:@selector(lc_setValue:forKey:)];
        
        [__NSDictionary0 lc_instanceSwizzleMethod:@selector(setValue:forUndefinedKey:) replaceMethod:@selector(lc_setValue:forUndefinedKey:)];
        
    });
}

- (instancetype)lc_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt {
    id instance = nil;
    @try {
        instance = [self lc_initWithObjects:objects forKeys:keys count:cnt];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        
        // 过滤数据
        NSUInteger index = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        id  _Nonnull __unsafe_unretained newkeys[cnt];
        for (int i = 0; i < cnt; i++) {
            if (objects[i] && keys[i]) {
                newObjects[index] = objects[i];
                newkeys[index] = keys[i];
                index++;
            }
        }
        instance = [self lc_initWithObjects:newObjects forKeys:newkeys count:index];
    }
    @finally {
        return instance;
    }
}

- (instancetype)lc_initWithObjects:(NSArray *)objects forKeys:(NSArray<id<NSCopying>> *)keys {
    id instance = nil;
    @try {
        instance = [self lc_initWithObjects:objects forKeys:keys];
    }
    @catch (NSException *exception) {
        [LCCrashHandleLog lc_logWithException:exception];
        
        // 过滤数据
        NSUInteger count = objects.count <= keys.count ? objects.count : keys.count;
        NSMutableArray *newObjects = [[NSMutableArray alloc] init];
        NSMutableArray *newKeys = [[NSMutableArray alloc] init];
        for (int i = 0; i < count; i++) {
            if (objects[i] && keys[i]) {
                [newObjects addObject:objects[i]];
                [newKeys addObject:keys[i]];
            }
        }
        instance = [self lc_initWithObjects:newObjects forKeys:newKeys];
    }
    @finally {
        return instance;
    }
}

- (void)lc_setValue:(id)value forKey:(NSString *)key {
    @try {
        [self lc_setValue:value forKey:key];
    }
    @catch (NSException *exception) {
       [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
                
    }
}

- (void)lc_setValue:(id)value forUndefinedKey:(NSString *)key {
    @try {
        [self lc_setValue:value forUndefinedKey:key];
    }
    @catch (NSException *exception) {
       [LCCrashHandleLog lc_logWithException:exception];
    }
    @finally {
                
    }
}
@end
