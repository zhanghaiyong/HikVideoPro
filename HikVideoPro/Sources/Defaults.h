//
//  Defaults.h
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/4.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#ifndef Defaults_h
#define Defaults_h

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define RGBA(r,g,b,a)      [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define kBackColor [UIColor colorWithHex:0xF1F2F4]

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define kMainColor [UIColor colorWithHex:0x334079]

#define ShadowColor [UIColor colorWithHex:0x00251E]

#define ColorsArray [NSArray arrayWithObjects:[UIColor colorWithHex:0xEE1B26],[UIColor colorWithHex:0xFEB11A],[UIColor colorWithHex:0x97C03C],[UIColor colorWithHex:0x03A64F],[UIColor colorWithHex:0xCC6A2D],[UIColor colorWithHex:0xFCF101],[UIColor colorWithHex:0x039EA5],[UIColor colorWithHex:0xD3DC1E],[UIColor colorWithHex:0x01ACF0],[UIColor colorWithHex:0x799C40],[UIColor colorWithHex:0xEF008C],[UIColor colorWithHex:0x2E3296],[UIColor colorWithHex:0xD2576A],[UIColor colorWithHex:0x005BA9],[UIColor colorWithHex:0x6F2C91], nil]



//判断是不是iPhoneX
#define isIPhoneX (kStatusBarHeight > 20 ? YES : NO)

#ifdef DEBUG
#define HYLog(format,...) printf("%s",[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])
#else
#define HYLog(...)
#endif

#define SharedApp ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define KDeviceFrame [UIScreen mainScreen].bounds

#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/**
  *  get the saved objects       获得存储的对象
  */
#define UserDefaultObjectForKey(__KEY__) [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

/**
  *  delete objects      删除对象
  */
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}


#endif /* Defaults_h */
