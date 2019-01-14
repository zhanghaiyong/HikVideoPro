//
//  CAShapeLayerView.m
//  HospitalData
//
//  Created by JSG on 2018/11/28.
//  Copyright © 2018 JSG. All rights reserved.
//


#import "CAShapeLayerView.h"

@interface CAShapeLayerView()
{
    CAShapeLayer *shapeLayer;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
}
@end

@implementation CAShapeLayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUP];
    }
    return self;
}

- (void)setUP {
    
    //第一步，通过UIBezierPath设置圆形的矢量路径
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    //第二步，用CAShapeLayer沿着第一步的路径画一个完整的环（颜色灰色，起始点0，终结点1）
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = self.bounds;//设置Frame
    bgLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色=透明色
    bgLayer.lineWidth = 5.f;//线条大小
    bgLayer.strokeColor = [UIColor colorWithHex:0xC2D1DC].CGColor;//线条颜色
    bgLayer.strokeStart = 0.f;//路径开始位置
    bgLayer.strokeEnd = 1.f;//路径结束位置
    bgLayer.path = circle.CGPath;//设置bgLayer的绘制路径为circle的路径
    [self.layer addSublayer:bgLayer];//添加到屏幕上
    
    //第三步，用CAShapeLayer沿着第一步的路径画一个红色的环形进度条，但是起始点=终结点=0，所以开始不可见
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 10.f;
    shapeLayer.strokeColor = kMainColor.CGColor;
    shapeLayer.strokeStart = 0;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.strokeEnd = 0;
    shapeLayer.path = circle.CGPath;
    [self.layer addSublayer:shapeLayer];
    
    
    label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height/2-32, self.width, 32)];
    label1.font = [UIFont fontWithName:@"ArialMT" size:38];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = kMainColor;
    [self addSubview:label1];
    
    label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, label1.bottom, self.width, 20)];
    label2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = kMainColor;
    [self addSubview:label2];
    
    label3 = [[UILabel alloc]initWithFrame:CGRectMake(30, label2.bottom+8, self.width-60, 25)];
    label3.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.layer.cornerRadius = 4;
    label3.clipsToBounds = YES;
    [self addSubview:label3];
    
    
}

-(void)setStrokeEnd:(CGFloat)strokeEnd {
    
    _strokeEnd = strokeEnd;
    shapeLayer.strokeEnd = strokeEnd;
}

-(void)setStrokeStart:(CGFloat)strokeStart {
    _strokeStart = strokeStart;
    shapeLayer.strokeStart = strokeStart;
}

- (void)setValue1:(NSString *)value1 {
    _value1 = value1;
    label1.text = value1;
}

- (void)setValue2:(NSString *)value2 {
    _value2 = value2;
    label2.text = value2;
}

- (void)setValue3:(NSDictionary *)value3 {
    _value3 = value3;
    
    UIColor *color = (UIColor *)value3[@"color"];
    label3.text = value3[@"value"];
    label3.textColor = color;
    label3.backgroundColor = [color colorWithAlphaComponent:0.3];
}

@end
