//
//  LCCrashHandleManager.m
//  LCCrashHandle
//
//  Created by liangrc on 2019/12/27.
//

#import "LCCrashHandleManager.h"
#import "NSArray+LCCrashHandle.h"
#import "NSMutableArray+LCCrashHandle.h"
#import "NSDictionary+LCCrashHandle.h"
#import "NSMutableDictionary+LCCrashHandle.h"
#import "NSString+LCCrashHandle.h"
#import "NSMutableString+LCCrashHandle.h"
#import "NSAttributedString+LCCrashHandle.h"
#import "NSMutableAttributedString+LCCrashHandle.h"
#import "NSObject+LCSelectorCrashHandle.h"

@implementation LCCrashHandleManager

+ (void)lc_enableAllCrashHandleCompoment {
    [NSArray lc_enableArrayProtector];
    [NSMutableArray lc_enableNSMutableArrayProtector];
    [NSDictionary lc_enableNSDictionaryProtector];
    [NSMutableDictionary lc_enableNSMutableDictionaryProtector];
    [NSString lc_enableNSStringProtector];
    [NSMutableString lc_enableNSMutableStringProtector];
    [NSAttributedString lc_enableNSAttributedStringProtector];
    [NSMutableAttributedString lc_enableNSMutableAttributedStringProtector];
    
    [NSObject lc_enableSelectorProtector];
}

@end
