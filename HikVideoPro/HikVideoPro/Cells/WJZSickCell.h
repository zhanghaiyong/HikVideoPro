//
//  WJZSickCell.h
//  HospitalData
//
//  Created by JSG on 2018/11/30.
//  Copyright © 2018 JSG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJZSickCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *sickName;
@property (weak, nonatomic) IBOutlet UILabel *flagLab;
@property (weak, nonatomic) IBOutlet UILabel *flagNameLab;
@property (weak, nonatomic) IBOutlet UILabel *upDownLab;
@property (weak, nonatomic) IBOutlet UILabel *statusLab;
@property (weak, nonatomic) IBOutlet UIView *backView;


@end

NS_ASSUME_NONNULL_END
