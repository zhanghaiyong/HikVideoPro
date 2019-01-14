//
//  TopView.h
//  NURSE
//
//  Created by JSG on 2019/1/8.
//  Copyright © 2019 JSG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopThreeView : UIView


@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UILabel *title2;
@property (weak, nonatomic) IBOutlet UILabel *title3;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property (weak, nonatomic) IBOutlet UIImageView *arrow3;


@end

NS_ASSUME_NONNULL_END
