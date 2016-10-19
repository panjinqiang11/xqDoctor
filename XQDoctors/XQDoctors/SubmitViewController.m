//
//  SubmitViewController.m
//  tijiao
//
//  Created by LiWenShuang on 16/6/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "SubmitViewController.h"

@interface SubmitViewController ()

@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //标题
    self.title = @"已提交审核";
    
    UIImage *image = [[UIImage imageNamed:@"background"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem.leftBarButtonItem setImageInsets:UIEdgeInsetsMake(0, 0, 10, 0)];
    
}



@end
