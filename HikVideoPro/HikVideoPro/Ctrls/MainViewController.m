//
//  MainViewController.m
//  HikVideoPro
//
//  Created by JSG on 2019/1/14.
//  Copyright © 2019 JSG. All rights reserved.
//

#import "MainViewController.h"
#import "IncludeCellView.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return (4+1)*40;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *reuser = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuser];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuser];
//    }
//    cell.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
//    cell.contentView.layer.shadowOffset = CGSizeMake(0, 0);
//    cell.contentView.layer.shadowRadius  = 3;
//    cell.contentView.layer.shadowOpacity = 0.3;
//    IncludeCellView *includeCellView = [[IncludeCellView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 4*39)];
//    [cell addSubview:includeCellView];
//    includeCellView.dataSource = @[@"1",@"2",@"3",@"4"];
//    return cell;
//}


@end
