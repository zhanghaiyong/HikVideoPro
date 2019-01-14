//
//  HYSegmentView.m
//  GVG
//
//  Created by edianzu on 2018/4/12.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "HYSegmentView.h"


@interface HYSegmentView()
{
    UIScrollView *scrollView;
    
    NSInteger currentIndex;
    UIView *bottomLine;
    NSMutableArray *labelArray;
    NSArray *normalColor;
    NSArray *selectColor;
    
}
@end

@implementation HYSegmentView

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    [self initUI];
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)array selectIndex:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        
        normalColor = @[@"40",@"46",@"50"];
        selectColor = @[@"1",@"206",@"159"];
        labelArray = [NSMutableArray array];
        currentIndex = index;
        if (array.count > 0) {
            self.titleArray = [NSArray arrayWithArray:array];
            [self initUI];
        }
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)initUI {
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height-1)];
    scrollView.bounces = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
    NSInteger tag = 0;
    CGFloat contentWidth = 0;
    
    for (NSString *str in self.titleArray) {
        CGRect titleRect = [str boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin |
                            NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
        contentWidth += titleRect.size.width;
    }
    
    CGFloat labelW = 0;
    for (NSString *str in self.titleArray) {
        if (contentWidth <= self.width) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.width/self.titleArray.count*tag, 0, self.width/self.titleArray.count, scrollView.height)];
            label.text = str;
            label.userInteractionEnabled = YES;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = RGBA([normalColor[0] floatValue], [normalColor[1] floatValue], [normalColor[2] floatValue], 0.5);
            label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
            label.tag = tag;
            [scrollView addSubview:label];
            [labelArray addObject:label];
            
            if (tag == currentIndex) {
                
                bottomLine = [[UIView alloc]initWithFrame:CGRectMake(label.left, self.height-2.5, label.width, 3)];
                bottomLine.backgroundColor = RGBA([selectColor[0] floatValue], [selectColor[1] floatValue], [selectColor[2] floatValue], 1);
                [scrollView addSubview:bottomLine];
                
                label.textColor = RGBA([selectColor[0] floatValue], [selectColor[1] floatValue], [selectColor[2] floatValue], 1);
            }
            tag ++;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTapAction:)];
            [label addGestureRecognizer:tap];
            
        }else {
         
            CGRect titleRect = [str boundingRectWithSize:CGSizeMake(0, 20) options:NSStringDrawingUsesLineFragmentOrigin |
                                NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelW, 0, titleRect.size.width, scrollView.height)];
            label.text = str;
            label.userInteractionEnabled = YES;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = RGBA([normalColor[0] floatValue], [normalColor[1] floatValue], [normalColor[2] floatValue], 0.5);
            label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
            label.tag = tag;
            [scrollView addSubview:label];
            [labelArray addObject:label];
            if (tag == currentIndex) {
                
                bottomLine = [[UIView alloc]initWithFrame:CGRectMake(label.left, self.height-2.5, label.width, 3)];
                bottomLine.backgroundColor = RGBA([selectColor[0] floatValue], [selectColor[1] floatValue], [selectColor[2] floatValue], 1);
                [scrollView addSubview:bottomLine];
                
                label.textColor = RGBA([selectColor[0] floatValue], [selectColor[1] floatValue], [selectColor[2] floatValue], 1);
            }
            tag ++;
            labelW += titleRect.size.width;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTapAction:)];
            [label addGestureRecognizer:tap];
        }
    }
    
    if (contentWidth <= self.width) {
        scrollView.contentSize = CGSizeMake(self.width, self.height);
    }else {
        scrollView.contentSize = CGSizeMake(contentWidth, self.height);
    }
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
    line.backgroundColor = [UIColor colorWithHex:0xEFEFEF];
    [self addSubview:line];
    
}

- (void)handleChange:(NSInteger)index {
    
    for (UILabel *lab in labelArray) {
        lab.textColor = RGBA([normalColor[0] floatValue], [normalColor[1] floatValue], [normalColor[2] floatValue], 0.5);
    }
    
    UILabel *newLabel = labelArray[index];
    newLabel.textColor = RGBA([selectColor[0] floatValue], [selectColor[1] floatValue], [selectColor[2] floatValue], 1);
    
    //修改下划线的位置
    [UIView animateWithDuration:0.15 animations:^{
        self->bottomLine.frame = CGRectMake(newLabel.left, self.height-2.5, newLabel.width, 3);
    }];
    
    //将点击的cell移动到中间位置
    CGFloat offset = newLabel.center.x - scrollView.width/2;
    if (offset > scrollView.contentSize.width - scrollView.width) {
        
        offset = scrollView.contentSize.width - scrollView.width;
    }
    if (offset < 0) {
        offset = 0;
    }
    
    [scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
//    if ([self.delegate respondsToSelector:@selector(segmentViewChangeLabelWIthIndex:)]) {
//        [self.delegate segmentViewChangeLabelWIthIndex:newLabel.tag];
//    }
    
    //记录位置
    currentIndex = index;
}

- (void)labelTapAction:(UIGestureRecognizer *)gesture {

    //当前
    UILabel *currentLab = (UILabel *)gesture.view;
    
    for (UILabel *lab in labelArray) {
        lab.textColor = RGBA([normalColor[0] floatValue], [normalColor[1] floatValue], [normalColor[2] floatValue], 0.5);
    }
    //修改颜色值
    currentLab.textColor = RGBA([selectColor[0] floatValue], [selectColor[1] floatValue], [selectColor[2] floatValue], 1);
    
    //修改下划线的位置
    [UIView animateWithDuration:0.15 animations:^{
        self->bottomLine.frame = CGRectMake(currentLab.left, self.height-2.5, currentLab.width, 3);
    }];
    
    //将点击的cell移动到中间位置
    CGFloat offset = currentLab.center.x - scrollView.width/2;
    if (offset > scrollView.contentSize.width - scrollView.width) {
        
        offset = scrollView.contentSize.width - scrollView.width;
    }
    if (offset < 0) {
        offset = 0;
    }
    
    [scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(segmentViewChangeLabelWIthIndex:)]) {
        [self.delegate segmentViewChangeLabelWIthIndex:currentLab.tag];
    }
    
    //记录位置
    currentIndex = currentLab.tag;
    NSLog(@"tap currentIndex = %ld",currentIndex);
}

- (void)changeTitleWithProgress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex {
    
    
    UILabel *sourceLab = labelArray[sourceIndex];
    UILabel *targetLab = labelArray[targetIndex];
    
    //将点击的cell移动到中间位置
    CGFloat offset = targetLab.center.x - scrollView.width/2;
    if (offset > scrollView.contentSize.width - scrollView.width) {
        
        offset = scrollView.contentSize.width - scrollView.width;
    }
    if (offset < 0) {
        offset = 0;
    }
    [scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
    //2.1一共需要移动多少的距离
    CGFloat totalMoveX = targetLab.left - sourceLab.left;
    //通过progress来计算滑块的偏移量
    CGFloat moveX = progress * totalMoveX;
    //计算bottom长度的变化
    CGFloat widthChange = (targetLab.width - sourceLab.width) * progress;
    //每次移动，在原来的基础上sourceLabel.frame.origin.x加上偏移量
    bottomLine.frame = CGRectMake(sourceLab.left + moveX, self.height-2.5, sourceLab.width + widthChange, 3);
    
    //3.1取出变化的范围

    NSArray *colorDelta = @[[NSString stringWithFormat:@"%f",[selectColor[0] floatValue] - [normalColor[0] floatValue]],[NSString stringWithFormat:@"%f",[selectColor[1] floatValue] - [normalColor[1] floatValue]],[NSString stringWithFormat:@"%f",[selectColor[2] floatValue] - [normalColor[2] floatValue]]];
    
    //3.2 变化sourceLabel
    sourceLab.textColor = RGBA(([selectColor[0] floatValue]-[colorDelta[0] floatValue]*progress) , ([selectColor[1] floatValue]-[colorDelta[1] floatValue]*progress),
        ([selectColor[2] floatValue]-[colorDelta[2] floatValue]*progress), 1);
    
     //3.3变化targetLabel
    targetLab.textColor = RGBA(([normalColor[0] floatValue]+[colorDelta[0] floatValue]*progress) , ([normalColor[1] floatValue]+[colorDelta[1] floatValue]*progress),
        ([normalColor[2] floatValue]+[colorDelta[2] floatValue]*progress), 1);
    
    //4 记录最新的index
//    currentIndex = targetIndex;
    
//    NSLog(@"targetIndex = %ld",currentIndex);
    
}

@end
