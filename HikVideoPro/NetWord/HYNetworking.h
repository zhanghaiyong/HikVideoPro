//
//  HYNetworking.h
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/7.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XLFileConfig;

@interface HYNetworking : NSObject
/**
 请求成功block
 */
typedef void (^requestSuccessBlock)(id responseObj);

/**
 请求失败block
 */
typedef void (^requestFailureBlock) (NSError *error);


+(void)cancelquest;

/**
 GET请求
 */
+ (void)getRequest:(NSString *)url params:(id)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler;

/**
 POST请求
 */
+ (void)postRequest:(NSString *)url params:(id)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler;



@end
