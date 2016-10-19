//
//  DJAddLabelViewController.m
//  dijiao
//
//  Created by LiWenShuang on 16/7/1.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "DJAddLabelViewController.h"

@interface DJAddLabelViewController ()

@end

@implementation DJAddLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"添加其它标签";
    
    //设置界面
    [self setUpUI];
}

//设置导航条
- (void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回箭头"] style:UIBarButtonItemStylePlain target:self action:@selector(cancle)];
    
    //右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(certain)];
}

//确定并提交
- (void)certain
{
    [self.navigationController popViewControllerAnimated:NO];
}

//返回
- (void)cancle
{
    [self.navigationController popViewControllerAnimated:NO];
}

@end
