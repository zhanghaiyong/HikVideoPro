//
//  CustomNavigationBar.h
//  NursePort
//
//  Created by JSG on 2018/11/13.
//  Copyright © 2018 JSG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomNavigationBar : UIView
@property (nonatomic,strong)UILabel *naviTitle;
@property (nonatomic,strong)UIButton *messageBtn;
@property (nonatomic,strong)UIButton *backBtn;
@property (nonatomic,copy)void(^leftBlock)(void);
@property (nonatomic,copy)void(^rightBlock)(void);

@end

NS_ASSUME_NONNULL_END
