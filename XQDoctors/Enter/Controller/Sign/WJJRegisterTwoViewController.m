//
//  WJJRegisterTwoViewController.m
//  XQDoctor
//
//  Created by whitcast on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "WJJRegisterTwoViewController.h"
#import "WJJRegisterViewController.h"
#import "EnterTools.h"
#import <UIViewController+MMDrawerController.h>
#import "rwdSettingController.h"

@interface WJJRegisterTwoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *IDType;
@property (weak, nonatomic) IBOutlet UILabel *IDNunber;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *address;

@end

@implementation WJJRegisterTwoViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"用户注册";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(returnButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"2/2" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    //给label赋值
    self.name.text = self.array[0];
    self.IDType.text = self.array[1];
    self.IDNunber.text = self.array[2];
    self.phoneNumber.text = self.array[3];
    self.address.text = self.array[4];
    
}

//返回
- (void)returnButton{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerEnter:(UIButton *)sender {
    
    EnterTools *enter = [EnterTools sharedIsEnter];
    
    enter.isOnline = YES;
    
     [(rwdSettingController *)self.mm_drawerController.leftDrawerViewController loadheader];
    
    [self.navigationController popToRootViewControllerAnimated:YES];

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
