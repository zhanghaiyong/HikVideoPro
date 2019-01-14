//
//  LZUserInfo.m
//  UnionsBuy
//
//  Created by langZai on 2017/5/4.
//  Copyright © 2017年 langZai. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo

static UserInfo *model = nil;

+ (instancetype)shareInfo {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[UserInfo alloc] init];
    });
    return model;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [super allocWithZone:zone];
    });
    return model;
}

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:_account forKey:@"account"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeObject:_nickname forKey:@"nickname"];
    [aCoder encodeObject:_yyid forKey:@"yyid"];
    [aCoder encodeObject:_phone forKey:@"phone"];
    [aCoder encodeObject:_avatar forKey:@"avatar"];
    [aCoder encodeObject:_IP forKey:@"IP"];
    [aCoder encodeObject:_port forKey:@"port"];
    [aCoder encodeObject:_isLogin forKey:@"isLogin"];

}

//解归档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        _account = [aDecoder decodeObjectForKey:@"account"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _password = [aDecoder decodeObjectForKey:@"password"];
        _nickname = [aDecoder decodeObjectForKey:@"nickname"];
        _yyid = [aDecoder decodeObjectForKey:@"yyid"];
        _phone = [aDecoder decodeObjectForKey:@"phone"];
        _avatar = [aDecoder decodeObjectForKey:@"avatar"];
        _IP = [aDecoder decodeObjectForKey:@"IP"];
        _port = [aDecoder decodeObjectForKey:@"port"];
        _isLogin = [aDecoder decodeObjectForKey:@"isLogin"];

    }
    return self;
}

// 保存模型
+ (void)saveUserModel:(UserInfo *)model {
    //将模型装换成数据类型
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    UserDefaultSetObjectForKey(data,@"USERINFO");
}

+ (UserInfo *)userModel {
    
    UserInfo *model = [UserInfo shareInfo];
    NSData *data = UserDefaultObjectForKey(@"USERINFO");
    if ( [NSKeyedUnarchiver unarchiveObjectWithData:data]) {
        model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    };
    return model;
}


// 移除所有用户信息
+ (void)deleteUserInfo {
    
    UserDefaultRemoveObjectForKey(@"USERINFO");
}


@end
