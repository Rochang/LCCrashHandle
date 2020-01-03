//
//  LCViewController.m
//  LCCrashHandle
//
//  Created by Rochang on 12/26/2019.
//  Copyright (c) 2019 Rochang. All rights reserved.
//

#import "LCViewController.h"
#import "LCCrashHandleManager.h"

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [LCCrashHandleManager lc_enableAllCrashHandleCompoment];
    
    [self testCrashHandleCompoment];
}

- (void)testCrashHandleCompoment {
    
    /**
     类方法 的 拦截失败,测试发现
     - (id)forwardingTargetForSelector:(SEL)aSelector;
     - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector;
     - (void)forwardInvocation:(NSInvocation *)anInvocation;
     */
    // // [LCViewController testClassMethod];
    
    // unrecognized selector sent to instance 0x7ff7aac061d0
    [self performSelector:@selector(adc)];
    
    [self NSArray_Test_Init];
    [self NSArray_Test_ObjectAtIndex];
    [self NSArray_Test_objectsAtIndexes];
    [self NSArray_Test_getObjectsRange];

    [self NSMutableArray_Test_ObjectAtIndex];
    [self NSMutableArray_Test_GetObjectsRange];
    [self NSMutableArray_Test_SetObjectAtIndex];
    [self NSMutableArray_Test_InsertObjectAtIndex];
    [self NSMutableArray_Test_RemoveObjectAtIndex];

    [self NSDictionary_Test_InstanceDictionary];
    [self NSDictionary_Test_ClassDictionary];
    [self NSDictionary_Test_SetValueForKey];

    [self NSMutableDictionary_Test_SetObjectForKey];
    [self NSMutableDictionary_Test_RemoveObjectForKey];

    [self NSString_Test_SubstringToIndex];
    [self NSString_Test_SubstringFromIndex];
    [self NSString_Test_SubstringWithRange];
    [self NSString_Test_StringByReplacingOccurrencesOfString];
    [self NSString_Test_StringByReplacingOccurrencesOfStringRange];

    [self NSMutableString_Test_InsertStringAtIndex];
    [self NSMutableString_TestDeleteCharactersInRange];
    [self NSMutableString_Test_ReplaceCharactersInRange];

    [self NSAttributedString_Test_InitWithString];
    [self NSAttributedString_Test_InitWithAttributedString];
    [self NSAttributedString_Test_InitWithStringAttributes];

    [self NSMutableAttributedString_Test_InitWithString];
    [self NSMutableAttributedString_Test_InitWithStringAttributes];
}

#pragma mark - NSArray
// -[__NSPlaceholderArray initWithObjects:count:]
- (void)NSArray_Test_Init {
    NSString *nilStr = nil;
    NSArray *array = @[@"eqe2", nilStr, @"23q3"];
    NSLog(@"%@", array);
}

// [__NSArrayI objectAtIndexedSubscript:]
- (void)NSArray_Test_ObjectAtIndex {
    NSArray *arr = @[@"23q3q", @"eqe2"];
    NSObject *object = arr[100];
    NSLog(@"%@", object);
}

// -[NSArray objectsAtIndexes:]
- (void)NSArray_Test_objectsAtIndexes {
    NSArray *array = @[@"geqe2"];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:100];
    [array objectsAtIndexes:indexSet];
}

// -[__NSArrayI getObjects:range:]
- (void)NSArray_Test_getObjectsRange {
    NSArray *array = @[@"1", @"2", @"3"];
    NSRange range = NSMakeRange(0, 11);
    __unsafe_unretained id cArray[range.length];
    [array getObjects:cArray range:range];
    
}

#pragma mark - NSMutableArray
// -[__NSArrayM objectAtIndexedSubscript:]
- (void)NSMutableArray_Test_ObjectAtIndex {
    NSMutableArray *array = @[@"gqeq"].mutableCopy;
    NSObject *object = array[2];
    NSLog(@"object = %@",object);
}

// -[__NSArrayM setObject:atIndexedSubscript:]
- (void)NSMutableArray_Test_SetObjectAtIndex {
    NSMutableArray *array = @[@"rqerqfq"].mutableCopy;
    array[3] = @"iOS";
}

// -[__NSArrayM removeObjectsInRange:]
- (void)NSMutableArray_Test_RemoveObjectAtIndex {
    NSMutableArray *array = @[@"cadadaeqe", @"qeqreq"].mutableCopy;
    [array removeObjectAtIndex:5];
}

// -[__NSArrayM insertObject:atIndex:]
- (void)NSMutableArray_Test_InsertObjectAtIndex {
    NSMutableArray *array = @[@"ffaiwefaefa"].mutableCopy;
    [array insertObject:@"cool" atIndex:5];}

// -[__NSArrayM getObjects:range:]
- (void)NSMutableArray_Test_GetObjectsRange {
    NSMutableArray *array = @[@"cadada", @"wqwe"].mutableCopy;
    NSRange range = NSMakeRange(0, 11);
    __unsafe_unretained id cArray[range.length];
    [array getObjects:cArray range:range];
}

#pragma mark - NSDictionary
// -[__NSPlaceholderDictionary initWithObjects:forKeys:count:]
- (void)NSDictionary_Test_InstanceDictionary {
    NSString *nilStr = nil;
    NSDictionary *dict = @{
                           @"name" : @"cadada",
                           @"age" : nilStr
                           };
    NSLog(@"%@",dict);
}

// -[NSDictionary initWithObjects:forKeys:]
- (void)NSDictionary_Test_ClassDictionary {
    NSString *nilStr = nil;
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[nilStr, @"faeawea", nilStr] forKeys:@[@"name", @"title", @"age"]];
    NSLog(@"%@",dict);
}

// [<__NSDictionary0 0x7fff8061ff80> setValue:forUndefinedKey:] 可以重写方法forUndefinedKey, 目前防崩溃做了处理
// -[__NSDictionary0 setValue:forKey:]
- (void)NSDictionary_Test_SetValueForKey {
    NSDictionary *dict = [NSDictionary dictionary];
    NSString *nilStr = nil;
    [dict setValue:nilStr forKey:@"age"];
    [dict setValue:@"age" forKey:nilStr];
    NSLog(@"%@",dict);
}

#pragma mark - NSMutableDictionary
// -[__NSDictionaryM setObject:forKeyedSubscript:]
- (void)NSMutableDictionary_Test_SetObjectForKey {
    NSMutableDictionary *dict = @{@"name" : @"ffaiwefaefa"}.mutableCopy;
    NSString *nilStr = nil;
    dict[nilStr] = @(25);
//    dict[@"name"] = nilStr;
    NSLog(@"%@",dict);
}

// -[__NSDictionaryM removeObjectForKey:]
- (void)NSMutableDictionary_Test_RemoveObjectForKey {
    NSMutableDictionary *dict = @{@"name" : @"ffaiwefaefa", @"age" : @(25)}.mutableCopy;
    NSString *key = nil;
    [dict removeObjectForKey:key];
    NSLog(@"%@",dict);
}

#pragma mark - NSString
// -[__NSCFConstantString substringFromIndex:]
- (void)NSString_Test_SubstringFromIndex {
    NSString *str = @"ffaiwefaefa";
    NSString *subStr = [str substringFromIndex:100];
    NSLog(@"%@",subStr);
}

// -[__NSCFConstantString substringToIndex:]
- (void)NSString_Test_SubstringToIndex {
    NSString *str = @"ffaiwefaefa";
    NSString *subStr = [str substringToIndex:100];
    NSLog(@"%@",subStr);
}

// -[__NSCFConstantString substringWithRange:]
- (void)NSString_Test_SubstringWithRange {
    NSString *str = @"ffaiwefaefa";
    NSRange range = NSMakeRange(0, 100);
    NSString *subStr = [str substringWithRange:range];
    NSLog(@"%@",subStr);
}

// -[__NSCFConstantString stringByReplacingOccurrencesOfString:withString:options:range:]
- (void)NSString_Test_StringByReplacingOccurrencesOfString {
    NSString *str = @"ffaiwefaefa";
    NSString *nilStr = nil;
    str = [str stringByReplacingOccurrencesOfString:nilStr withString:nilStr];
    NSLog(@"1 %@",str);
}

- (void)NSString_Test_StringByReplacingOccurrencesOfStringRange {
    NSString *str = @"ffaiwefaefa";
    NSRange range = NSMakeRange(0, 1000);
    str = [str stringByReplacingOccurrencesOfString:@"chen" withString:@"" options:NSCaseInsensitiveSearch range:range];
    NSLog(@"2 %@",str);
}

#pragma mark - NSMutableString
// -[__NSCFString replaceCharactersInRange:withString:]
- (void)NSMutableString_Test_ReplaceCharactersInRange {
    NSMutableString *strM = [NSMutableString stringWithFormat:@"chenfanfang"];
    NSRange range = NSMakeRange(0, 1000);
    [strM replaceCharactersInRange:range withString:@"--"];
}

// -[__NSCFString insertString:atIndex:]
- (void)NSMutableString_Test_InsertStringAtIndex{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"chenfanfang"];
    [strM insertString:@"cool" atIndex:1000];
}

// -[__NSCFString deleteCharactersInRange:]
- (void)NSMutableString_TestDeleteCharactersInRange{
    NSMutableString *strM = [NSMutableString stringWithFormat:@"chenfanfang"];
    NSRange range = NSMakeRange(0, 1000);
    [strM deleteCharactersInRange:range];
}

#pragma mark - NSAttributedString
// NSConcreteAttributedString initWithString:
- (void)NSAttributedString_Test_InitWithString {
    NSString *str = nil;
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str];
    NSLog(@"%@",attributeStr);
}

// NSConcreteAttributedString initWithString:
- (void)NSAttributedString_Test_InitWithAttributedString {
    NSAttributedString *nilAttributedStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"%@",attributedStr);
}

// NSConcreteAttributedString initWithString:
- (void)NSAttributedString_Test_InitWithStringAttributes {
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
    NSString *nilStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithString:nilStr attributes:attributes];
    NSLog(@"%@",attributedStr);
}

#pragma mark - NSMutableAttributedString
// NSConcreteMutableAttributedString initWithString:
- (void)NSMutableAttributedString_Test_InitWithString {
    NSString *nilStr = nil;
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:nilStr];
    NSLog(@"%@",attrStrM);
}

- (void)NSMutableAttributedString_Test_InitWithAttributedString {
    NSString *nilStr = nil;
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithAttributedString:nilStr];
    NSLog(@"%@",attrStrM);
}

// NSConcreteMutableAttributedString initWithString:attributes:
- (void)NSMutableAttributedString_Test_InitWithStringAttributes {
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
    NSString *nilStr = nil;
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:nilStr attributes:attributes];
    NSLog(@"%@",attrStrM);
}
@end
