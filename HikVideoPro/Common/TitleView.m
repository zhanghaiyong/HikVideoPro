//
//  TitleView.m
//  HospitalData
//
//  Created by JSG on 2018/11/28.
//  Copyright © 2018 JSG. All rights reserved.
//

#import "TitleView.h"

@interface TitleView()
@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UILabel *dateLab;
@end

@implementation TitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUP];
    }
    return self;
}

- (void)setUP {
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, 26)];
    self.titleLab.textColor = [UIColor colorWithHex:0x282E32];
    self.titleLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:19];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    
    self.dateLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.titleLab.bottom, self.width, 14)];

    self.dateLab.textColor = [UIColor colorWithHex:0x30363A];
    self.dateLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:10];
    self.dateLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLab];
    [self addSubview:self.dateLab];
}

- (void)setTitle:(NSString *)title subTitle:(NSString *)subTitle {
    
    self.titleLab.text = title;
    self.dateLab.text = subTitle;
}

@end
