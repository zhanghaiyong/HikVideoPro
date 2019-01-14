//
//  ShareManagerCtrl.h
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/7.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface ShareManagerCtrl : AFHTTPSessionManager
+ (AFHTTPSessionManager *)shareManager;
@end
