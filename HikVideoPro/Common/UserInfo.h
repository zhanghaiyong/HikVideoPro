//
//  UserInfo.h
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/12.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic,strong) NSString * account;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *yyid;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *IP;
@property (nonatomic, strong) NSString *port;
@property (nonatomic, strong) NSString *isLogin;


// 创建用户单例模型
+ (instancetype)shareInfo;
// 保存用户信息模型
+ (void)saveUserModel:(UserInfo *)model;
// 删除用户信息模型
+ (void)deleteUserInfo;

+ (UserInfo *)userModel;


@end
