//
//  CCTwoLeftTableViewController.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

/**
 *  选择科室左边的tableViewController
 */
#import "CCTwoLeftTableViewController.h"
#import "CCLeftViewCell.h"

@interface CCTwoLeftTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CCTwoLeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CCLeftViewCell" bundle:nil] forCellReuseIdentifier:@"leftCell"];
    //分页
    self.tableView.pagingEnabled = YES;
    //滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    //NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCLeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 87.;
}

@end
