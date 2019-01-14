//
//  HYNetworking.m
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/7.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import "HYNetworking.h"
#import "ShareManagerCtrl.h"

@implementation HYNetworking

+(void)cancelquest {
    
    AFHTTPSessionManager *manager = [ShareManagerCtrl shareManager];
    [[manager operationQueue] cancelAllOperations];
}

+ (void)getRequest:(NSString *)url params:(id)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler {
    
    //网络不可用
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil);
        return;
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"#%^{}\"[]|\\<> "].invertedSet];
    AFHTTPSessionManager *manager = [ShareManagerCtrl shareManager];
    [manager.requestSerializer setTimeoutInterval:15];

    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
//        NSLog(@"cookie = %@",response.allHeaderFields);
//        if ([[response.allHeaderFields allKeys]containsObject:@"Set-Cookie"]) {
//            model.cookies = [[response.allHeaderFields[@"Set-Cookie"] componentsSeparatedByString:@";"] firstObject];
//            [UserInfo saveUserModel:model];
//        }
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            successHandler(responseObject);
            
        }else if ([responseObject isKindOfClass:[NSArray class]]){
            successHandler(responseObject);
        }else if ([responseObject isKindOfClass:[NSString class]]){

            return ;
        }else{
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            
            successHandler(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        HYLog(@"------请求失败-------%@",error);
        [UItils showErrorProgress:@"网络不给力，请稍后再试！"];
        
        failureHandler(error);
    }];
}



+ (void)postRequest:(NSString *)url params:(id)params success:(requestSuccessBlock)successHandler failure:(requestFailureBlock)failureHandler {
    
    if (![self checkNetworkStatus]) {
        successHandler(nil);
        failureHandler(nil);
        return;
    }
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"#%^{}\"[]|\\<> "].invertedSet];
    
    AFHTTPSessionManager *manager = [ShareManagerCtrl shareManager];
    [manager.requestSerializer setTimeoutInterval:15];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
//        NSLog(@"cookie = %@",response.allHeaderFields);
//        
//        if ([[response.allHeaderFields allKeys]containsObject:@"Set-Cookie"]) {
//            model.cookies = [[response.allHeaderFields[@"Set-Cookie"] componentsSeparatedByString:@";"] firstObject];
//            [UserInfo saveUserModel:model];
//        }
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            successHandler(responseObject);
            
        }else if ([responseObject isKindOfClass:[NSArray class]]){
            
            successHandler(responseObject);
            
        }else if ([responseObject isKindOfClass:[NSString class]]){

            return ;
        }else{
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            successHandler(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        HYLog(@"------请求失败-------%@",error);
        [UItils showErrorProgress:@"网络不给力，请稍后再试！"];
        failureHandler(error);
    }];
}

/**
 监控网络状态
 */
+ (BOOL)checkNetworkStatus {
    
    __block BOOL isNetworkUse = YES;
    
    AFNetworkReachabilityManager *reachabilityManager = [AFNetworkReachabilityManager sharedManager];
    [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusUnknown) {
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            isNetworkUse = YES;
        } else if (status == AFNetworkReachabilityStatusNotReachable){
            // 网络异常操作
            isNetworkUse = NO;
//            KSMLog(@"网络异常,请检查网络是否可用！");
            return;
        }
    }];
    [reachabilityManager startMonitoring];
    return isNetworkUse;
}





@end
