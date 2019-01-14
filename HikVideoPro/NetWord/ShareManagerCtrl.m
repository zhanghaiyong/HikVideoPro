//
//  ShareManagerCtrl.m
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/7.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import "ShareManagerCtrl.h"

@implementation ShareManagerCtrl

+ (AFHTTPSessionManager *)shareManager {
    
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        manager.requestSerializer = [AFJSONRequestSerializer serializer];
//        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
//        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        NSString * cerPath = [[NSBundle mainBundle] pathForResource:@"api.m.sosoyy" ofType:@"cer"];
//        NSData * cerData = [NSData dataWithContentsOfFile:cerPath];
//        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[[NSSet alloc] initWithObjects:cerData, nil]];
        // 客户端是否信任非法证书
//        manager.securityPolicy.allowInvalidCertificates = YES;
        // 是否在证书域字段中验证域名
//        [manager.securityPolicy setValidatesDomainName:NO];
    });
    return manager;
}

@end
