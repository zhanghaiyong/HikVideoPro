//
//  CAShapeLayerView.h
//  HospitalData
//
//  Created by JSG on 2018/11/28.
//  Copyright © 2018 JSG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayerView : UIView

@property (nonatomic,assign)CGFloat strokeEnd;
@property (nonatomic,assign)CGFloat strokeStart;

@property (nonatomic,strong)NSString *value1;
@property (nonatomic,strong)NSString *value2;
@property (nonatomic,strong)NSDictionary *value3;

@end

NS_ASSUME_NONNULL_END
