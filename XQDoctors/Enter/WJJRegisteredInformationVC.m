//
//  WJJRegisteredInformationVC.m
//  完成提交
//
//  Created by whitcast on 16/6/30.
//  Copyright © 2016年 whitcast. All rights reserved.
//

#import "WJJRegisteredInformationVC.h"
#import "WJJFinishSubmitViewController.h"

@interface WJJRegisteredInformationVC ()
/**
 *  医院名称
 */
@property (weak, nonatomic) IBOutlet UILabel *hospitalNameLabel;
/**
 *  就诊日期
 */
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
/**
 *  就诊星期
 */
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
/**
 *  就诊时段
 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/**
 *  专家名称
 */
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;
/**
 *  就诊科室
 */
@property (weak, nonatomic) IBOutlet UILabel *officeLabel;
/**
 *  号源类型
 */
@property (weak, nonatomic) IBOutlet UILabel *doctorTypeLabel;
/**
 *  挂号费
 */
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
/**
 *  就诊卡号
 */
@property (weak, nonatomic) IBOutlet UITextField *treatCardTextField;
/**
 *  医保卡号
 */
@property (weak, nonatomic) IBOutlet UITextField *medicalCardTextField;
/**
 *  报销类型
 */
@property (weak, nonatomic) IBOutlet UITextField *submitTypeTextField;

@end

@implementation WJJRegisteredInformationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"挂号信息确认";
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
}

- (void) back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  确定预约 
 *  点击跳转下一页
 */
- (IBAction)clickNext:(UIButton *)sender {
    
    WJJFinishSubmitViewController *submitVC = [WJJFinishSubmitViewController new];
    submitVC.str1 = @"预约成功";
    submitVC.str2 = @"您已成功预约北京市仁和医院泌尿一科门诊的主任医师,预约识别码是:【20845200】,就诊日期是2015-07-24上午,取号时间上午10：00以前取号,取号地点:医院11号窗口挂号取号。【温馨提示】请点击 q.114menhu.com 安装114客户端，实现电话、网络同时挂号，提高成功率。";
    
    [self.navigationController pushViewController:submitVC animated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
