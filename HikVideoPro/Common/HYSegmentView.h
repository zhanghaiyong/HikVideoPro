//
//  HYSegmentView.h
//  GVG
//
//  Created by edianzu on 2018/4/12.
//  Copyright © 2018年 MAC. All rights reserved.
//



#import <UIKit/UIKit.h>

@protocol HYSegmentViewDelegate<NSObject>

- (void)segmentViewChangeLabelWIthIndex:(NSInteger)index;

@end

@interface HYSegmentView : UIView

@property (nonatomic,strong)NSArray *titleArray;
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)array selectIndex:(NSInteger)index;
- (void)handleChange:(NSInteger)index;
@property (nonatomic,assign)id <HYSegmentViewDelegate>delegate;
- (void)changeTitleWithProgress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;
@end
