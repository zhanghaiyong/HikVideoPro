//
//  AlertView.h
//  DOC_APP
//
//  Created by 张海勇 on 2018/7/4.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UIButton *refuseBtn;
@property (weak, nonatomic) IBOutlet UIButton *throughBtn;

@property (nonatomic,copy)void (^alertViewRefuseBlock)(void);
@property (nonatomic,copy)void (^alertViewThroughBlock)(void);

@end
