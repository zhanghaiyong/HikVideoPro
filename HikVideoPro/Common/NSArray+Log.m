//
//  NSArray+Log.m
//  DOC_APP
//
//  Created by edianzu on 2018/6/14.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

/** 解决数组输出中文乱码的问题 @return 输出结果 */
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *string = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [string appendFormat:@"\t%@,\n", obj];
        
    }];
    if ([string hasSuffix:@",\n"]) {
        [string deleteCharactersInRange:NSMakeRange(string.length - 2, 1)]; // 删除最后一个逗号
        
    }
    [string appendString:@")\n"];
    return string;
    
}

@end
