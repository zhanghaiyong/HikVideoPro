//
//  IncludeCellView.m
//  HospitalData
//
//  Created by JSG on 2018/11/30.
//  Copyright © 2018 JSG. All rights reserved.
//

#import "IncludeCellView.h"
//#import "WJZDetail_XM_Cell.h"
//#import "WJZDetail_CLJD_Cell.h"
#import "WJZSickCell.h"
@interface IncludeCellView()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableView;
}
@end

@implementation IncludeCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUP];
    }
    return self;
}

- (void)setUP {
    
    tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor clearColor];
    [self addSubview:tableView];
    
}

-(void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [tableView reloadData];
}

#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.height/self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuser = @"WJZSickCell";
    WJZSickCell *cell = [tableView dequeueReusableCellWithIdentifier:reuser];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"WJZSickCell" owner:self options:nil].lastObject;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    tableView.frame = self.bounds;
}

@end
