//
//  NSDictionary+Log.m
//  DOC_APP
//
//  Created by edianzu on 2018/6/14.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

/** 解决字典输出中文乱码的问题 @return 输出结果 */
//- (NSString *)descriptionWithLocale:(id)locale {
//
//    NSMutableString *string = [NSMutableString stringWithString:@"{\n"];
//    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//        [string appendFormat:@"\t%@ = %@;\n", key, obj];
//
//    }];
//    [string appendString:@"}\n"];
//    return string;
//
//}

#if DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale {
    
    
    NSMutableString *logString = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [logString appendFormat:@"\t%@ = %@;\n", key, obj];
        
    }];
    [logString appendString:@"}\n"];
    
    @try {
        logString = [[NSMutableString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
        
    } @catch (NSException *exception) {
        NSString *reason = [NSString stringWithFormat:@"reason:%@",exception.reason]; logString = [NSMutableString stringWithFormat:@"转换失败:\n%@,\n转换终止,输出如下:\n%@",reason,self.description];
        
    } @finally {
        
    }
    
    return logString;
    
}
#endif


- (NSDictionary *)deleteAllNullValue {
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys) {
        if ([[self objectForKey:keyStr] isEqual:[NSNull null]]) {
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else{
            [mutableDic setObject:[self objectForKey:keyStr] forKey:keyStr];
        }
    }
    return mutableDic;

}

@end
