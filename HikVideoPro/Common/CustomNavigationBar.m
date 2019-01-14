//
//  CustomNavigationBar.m
//  NursePort
//
//  Created by JSG on 2018/11/13.
//  Copyright © 2018 JSG. All rights reserved.
//

#import "CustomNavigationBar.h"

@interface CustomNavigationBar()



@end

@implementation CustomNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    self.messageBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.width-70, self.height-44+8, 60, 28)];
    self.messageBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.messageBtn.hidden = YES;
    [self.messageBtn setTitle:@"更多" forState:UIControlStateNormal];
    self.messageBtn.layer.cornerRadius = 14;
    self.messageBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.messageBtn.layer.borderWidth = 1;
    [self.messageBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.messageBtn];
    
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, self.height-44, 44, 44)];
    [self.backBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    self.backBtn.hidden = YES;
    [self.backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self addSubview:self.backBtn];
    
    self.naviTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.width/6, self.height-44, self.width/3*2, 44)];
    self.naviTitle.font = [UIFont boldSystemFontOfSize:20];
    self.naviTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.naviTitle];
}

- (void)leftAction {
    if (_leftBlock) {
        _leftBlock();
    }
}

- (void)rightAction {
    if (_rightBlock) {
        _rightBlock();
    }
}

@end
