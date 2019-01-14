//
//  ActionSheetView.m
//  DOC_APP
//
//  Created by 张海勇 on 2018/6/23.
//  Copyright © 2018年 张海勇. All rights reserved.
//

#define kRowHeight 44
#import "ActionSheetView.h"

@interface ActionSheetView()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *dataSource;
    UITableView *tableView;
}
@end

@implementation ActionSheetView

- (instancetype)initWithFrame:(CGRect)frame rowData:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor colorWithHex:0x06324D] colorWithAlphaComponent:0.3];
        dataSource = [NSArray arrayWithArray:array];
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.height-((dataSource.count+1)*kRowHeight + (isIPhoneX?34:0)), self.width, ((dataSource.count+1)*kRowHeight + (isIPhoneX?34:0)))];
    tableView.delegate = self;
    
    if (((dataSource.count+1)*kRowHeight + ([[UItils getDeviceName]rangeOfString:@"X"].location != NSNotFound ?  34 : 0)) >= self.height/2){
        tableView.frame = CGRectMake(0, self.height-self.height/2, self.width, self.height/2);
    }
    
    tableView.dataSource = self;
    tableView.separatorColor = kBackColor;
    tableView.separatorInset = UIEdgeInsetsMake(0, -10, 0, 0);
    [self addSubview:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 44)];
    view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.width-62, 0, 50, 44)];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:kMainColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    [button addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, kScreenWidth,0.6)];
    line.backgroundColor = kBackColor;
    [view addSubview:line];
    
    return view;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kRowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuser = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuser];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuser];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor colorWithHex:0x475158];
    cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    cell.textLabel.text = dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     if (_actionSheetSelectBlock) {
         _actionSheetSelectBlock(dataSource[indexPath.row]);
     }
}

- (void)cancelAction {
    
    if(_actionSheetCancelBlock) {
        _actionSheetCancelBlock();
    }
    
}

@end
