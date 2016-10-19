//
//  WJJFinishSubmitViewController.m
//  完成提交
//
//  Created by whitcast on 16/6/29.
//  Copyright © 2016年 whitcast. All rights reserved.
//

#import "WJJFinishSubmitViewController.h"

#import "rwdSettingController.h"
#import "XQMainTableViewController.h"

@interface WJJFinishSubmitViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation WJJFinishSubmitViewController

/**
 *  返回首页
 */
- (IBAction)returnInitial:(UIButton *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

/**
 *  个人中心
 */
- (IBAction)personalCenter:(UIButton *)sender {
  
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menu" object:nil];
    
    NSDictionary *dict = @{@"controller":self};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menu" object:nil userInfo:dict];
//     XQMainTableViewController *xq = [XQMainTableViewController new];
//    
//    [self.navigationController pushViewController:xq animated:NO];

    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"已提交审核";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    if (self.str1) {
        self.label1.text = self.str1;
    }
    
    if (self.str2) {
        self.label2.text = self.str2;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

/**
 *  点击返回方法
 */
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc
{
    NSLog(@"**********************");
}

@end
