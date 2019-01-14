//
//  AppDelegate.m
//  HikVideoPro
//
//  Created by JSG on 2019/1/14.
//  Copyright © 2019 JSG. All rights reserved.
//

#import "AppDelegate.h"
#import <IQKeyboardManager.h>
#import "LoginRegisterViewCtrl.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [UITabBar appearance].translucent = NO;
    
    [UINavigationBar appearance].barTintColor = kMainColor;
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           [UIFont fontWithName:@"PingFangSC-Semibold" size:18], NSFontAttributeName, nil]];
    
    //        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = NO;
    manager.enableAutoToolbar = NO;
    
    [self checkChange];
    
    UIStoryboard *SB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginRegisterViewCtrl *loginVc = [SB instantiateViewControllerWithIdentifier:@"LoginRegisterViewCtrl"];
    [self.window setRootViewController:loginVc];
    
    
    //    if ([[UserInfo userModel].isLogin isEqualToString:@"YES"]) {
    //        MYTabBarViewController *mYTabbar = [[MYTabBarViewController alloc]init];
    //        self.window.rootViewController = mYTabbar;
    //    }else {
    //        LoginViewCtrl *loginVC = [[LoginViewCtrl alloc]init];
    //        self.window.rootViewController = loginVC;
    //    }
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)checkChange {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus statusNet) {
        switch (statusNet) {
            case -1: {
                [UItils showErrorProgress:@"网络异常,请检查你的网络"];
                //未知网络
            }
                break;
            case 0: {
                [UItils showErrorProgress:@"网络异常,请检查你的网络"];
                //无法联网
            }
                break;
                
            default:
                break;
        }
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
