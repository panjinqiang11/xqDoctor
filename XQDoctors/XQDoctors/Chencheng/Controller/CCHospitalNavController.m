//
//  CCHospitalNavController.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "CCHospitalNavController.h"
#import "CCHospitalViewController.h"
#import "Masonry.h"
@interface CCHospitalNavController ()
@property (nonatomic , strong) CCHospitalViewController *hosPitalController;  //一级控制器
@property (nonatomic , strong)UIView *blueView;
@end

@implementation CCHospitalNavController

- (UIView *)blueView
{
    if (!_blueView) {
        
        _blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.navigationBar.frame.size.height)];
        _blueView.backgroundColor = [UIColor colorWithRed:0 green:192.0/255
                                                     blue:190.0/255 alpha:1.0];
      
            }
    return _blueView;
    
}

- (CCHospitalViewController *)hosPitalController
{
    if (!_hosPitalController) {
        _hosPitalController = [CCHospitalViewController new];
    }
    return _hosPitalController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[self.hosPitalController];
}






@end
