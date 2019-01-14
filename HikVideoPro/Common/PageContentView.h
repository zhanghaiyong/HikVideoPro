//
//  PageContentView.h
//  GVGTaobaobao
//
//  Created by edianzu on 2018/6/6.
//  Copyright © 2018年 600. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageContentViewDelegate<NSObject>

- (void)pageContent:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;

@end

@interface PageContentView : UIView



- (instancetype)initWithFrame:(CGRect)frame childs:(NSArray *)childs parentVC:(UIViewController *)vc;
- (void)setPageContent:(NSInteger)index;

@property (nonatomic,assign)id <PageContentViewDelegate>delegate;

@end
