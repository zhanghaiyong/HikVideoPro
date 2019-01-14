//
//  BackBtnViewController.m
//  NursePort
//
//  Created by JSG on 2018/11/19.
//  Copyright © 2018 JSG. All rights reserved.
//

#import "BackBtnViewController.h"

@interface BackBtnViewController()
{
    TitleView *titleView;
    NSMutableArray *rightItems;
}
@property (nonatomic,strong)HYSegmentView *segmentView;
@end

@interface BackBtnViewController ()

@end

@implementation BackBtnViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    rightItems = [NSMutableArray array];
    self.view.backgroundColor = kBackColor;
}

- (void)setTitleView:(NSString *)title subTitle:(NSString *)subTitle {
    
    if (!titleView) {
        titleView = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 44)];
        self.navigationItem.titleView = titleView;
    }

    [titleView setTitle:title subTitle:subTitle];
}

- (void)setLeftItem:(NSString *)image {
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:image] style:UIBarButtonItemStyleDone target:self action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setRightOneItem:(NSString *)image {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(itemOneAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    [rightItems addObject:item];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -10;
//    [rightItems addObject:negativeSpacer];
    
}

- (void)setRightTwoItem:(NSString *)image {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(itemTwoAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    [rightItems addObject:item];
}

- (void)showRightItem {
    
    self.navigationItem.rightBarButtonItems = rightItems;
}

- (void)leftItemAction {
    
    
}

- (void)itemOneAction {
    
}

- (void)itemTwoAction {
    
}

- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
    }
    
    return dateFormatter;
}

@end
