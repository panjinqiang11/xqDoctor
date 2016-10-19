//
//  WJJEnterViewController.m
//  XQDoctor
//
//  Created by whitcast on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "WJJEnterViewController.h"
#import "WJJRegisterViewController.h"
#import <UIViewController+MMDrawerController.h>
#import "rwdSettingController.h"
#import "personDataModel.h"
#import "EnterTools.h"

@interface WJJEnterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *ID;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *testNumber;

@end

@implementation WJJEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  发送网络请求单例
     */
    [personDataModel sharedPersonDataModel];
    
    self.navigationItem.title = @"用户登录";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"快速注册" style:UIBarButtonItemStylePlain target:self  action:@selector(setRegisterVC)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backVc)];
    
    //设置textField 左边图标
    [self textFieldleftImageWithImageName:@"u20" andTextField:self.name];
    [self textFieldleftImageWithImageName:@"u20" andTextField:self.ID];
    [self textFieldleftImageWithImageName:@"u24" andTextField:self.phoneNumber];
    [self textFieldleftImageWithImageName:@"u28" andTextField:self.testNumber];

}


/**
 *  设置textField 左边图标的方法
 *
 */
- (void)textFieldleftImageWithImageName:(NSString *)imageName andTextField:(UITextField *)textField{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, textField.frame.size.height/2, textField.frame.size.height-10)];
    imageView.image = [UIImage imageNamed:imageName];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, textField.frame.size.height, textField.frame.size.height)];
    
    [view addSubview:imageView];
    
    textField.leftView = view;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
}


/**
 *  跳转到注册控制器
 */
- (void)setRegisterVC{
    
    WJJRegisterViewController *registerVC = [WJJRegisterViewController new];
    
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
}
//返回到主界面
- (void)backVc{

    [self.navigationController popViewControllerAnimated:YES];
    //[self.mm_drawerController reloadInputViews];
    //[self.mm_drawerController.popoverPresentationController d:YES];
}

- (IBAction)touchEnterLogin:(UIButton *)sender {
    
    EnterTools *enter = [EnterTools sharedIsEnter];
    
    enter.isOnline = YES;
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    [(rwdSettingController *)self.mm_drawerController.leftDrawerViewController loadheader];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
