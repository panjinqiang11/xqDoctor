//
//  CCTwoRightTableViewController.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

/**
 *  选择科室右边的tableViewController
 */
#import "CCTwoRightTableViewController.h"
#import "CCRightViewCell.h"
#import "CCBaseDocInfoViewController.h"
#import "CCBaseDocInfoViewController.h"
#import "CCHospitalViewController.h"
#import "PJTableViewController.h"
@interface CCTwoRightTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CCTwoRightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CCRightViewCell" bundle:nil] forCellReuseIdentifier:@"rightCell"];
    //分页
    self.tableView.pagingEnabled = YES;
    //取消滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCRightViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightCell"forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52.;
}

#pragma mark -- 右边tableViewCell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

     //判断是不是从按医院push的
    if (self.isHospital==YES) {
        //跳到医生选择控制器
        PJTableViewController *base = [PJTableViewController new];
       
        [self.mainCon.navigationController pushViewController:base animated:YES];
    }else
    {
        //回到医院控制器
//
        if (self.hosCon!=nil) {
            CCHospitalViewController *hos = [CCHospitalViewController new];
            hos.isDept = YES;
            [self.mainCon.navigationController pushViewController:hos animated:YES];
        }else{
//        [self.mainCon.navigationController pushViewController:self.hosCon animated:YES];
            PJTableViewController *base = [PJTableViewController new];
            
            [self.mainCon.navigationController pushViewController:base animated:YES];
        }
    }
}




@end
