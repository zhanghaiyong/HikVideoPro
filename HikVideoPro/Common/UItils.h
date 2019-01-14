//
//  UItils.h
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/9.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UItils : NSObject

//设置阴影
+ (void)addShadow:(UIView *)view colr:(UIColor *)color offset:(CGSize)size opacity:(CGFloat)opacity radius:(CGFloat)radius;

//NSString是否可以转换成Int
+ (BOOL)isPureInt:(NSString *)string;

// 字典转json字符串方法

+(NSString *)convertToJsonData:(NSDictionary *)dict;

+ (void)showSVProgress;

+ (void)showWithStatus:(NSString *)tips;

+ (void)showSuccessProgress:(NSString *)tips;

+ (void)showErrorProgress:(NSString *)tips;

+ (void)showInfoProgress:(NSString *)tips;

+ (NSDictionary *)deleteEmpty:(NSDictionary *)dic;
+ (NSArray *)deleteEmptyArr:(NSArray *)arr;

+ (NSString *)ageMetohd:(NSString *)csrq;

+ (NSString *)ymdStr:(NSTimeInterval)timeInte format:(NSString *)format;


//本周的日期
+ (NSArray *)weeklyDates;

+ (NSString *)getDeviceName;

+ (CGFloat)initArc4random;

//模型转字典
+ (NSDictionary *)dicFromObject:(NSObject *)object;
@end
