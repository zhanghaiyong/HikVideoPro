//
//  BackBtnViewController.h
//  NursePort
//
//  Created by JSG on 2018/11/19.
//  Copyright © 2018 JSG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BackBtnViewController : UIViewController

//导航栏title和subtitle
- (void)setTitleView:(NSString *)title subTitle:(NSString *)subTitle;

//图片创建右边Item
- (void)setRightOneItem:(NSString *)image;
- (void)setRightTwoItem:(NSString *)image;

- (void)setLeftItem:(NSString *)image;
- (void)showRightItem;

- (void)leftItemAction;
- (void)itemOneAction;
- (void)itemTwoAction;
- (NSDateFormatter *)dateFormatter;
@end

NS_ASSUME_NONNULL_END
