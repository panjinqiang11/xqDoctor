//
//  XQMainTableViewController.m
//  XQDoctor
//
//  Created by 张清 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "XQMainTableViewController.h"/Users/liZhenHua/XQDoctors/XQDoctors/XQDoctors/XQMainTableView.storyboard
#import "MMDrawerController.h"
#import "CCHospitalViewController.h"
#import "RightViewController.h"
#import "XQMingYiTongViewController.h"
#import <UIViewController+MMDrawerController.h>
#import "CCDeptMainViewController.h"
#import "EnterTools.h"
#import "WJJEnterViewController.h"
#import "CCBaseDocInfoViewController.h"
#import "CCDeptMainViewController.h"
#import "WJJFinishSubmitViewController.h"

//判断是否登录
#define OnLine EnterTools *enter = [EnterTools sharedIsEnter];\
if(!enter.isOnline){\
WJJEnterViewController *enterVc = [[WJJEnterViewController alloc]init];\
[self.navigationController pushViewController:enterVc animated:YES];\
return;\
}

@interface XQMainTableViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@end

@implementation XQMainTableViewController

//界面消失的时候调用
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //关闭侧滑手势
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeNone;
    
}
//界面显示的时候调用
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //打开侧滑手势
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置返回手势的代理
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    //设置导航栏
    [self setNavBar];
    
    //接受个人中心发送的通知
    [self menuBarClick_CC];
   
}
#pragma mark -- 按医院
- (IBAction)findHospitalBtn:(UIButton *)sender {
    
    OnLine
    
    CCHospitalViewController *ccController = [CCHospitalViewController new];
    
    [self.navigationController pushViewController:ccController animated:YES];
}
#pragma mark -- 按科室
- (IBAction)deptBtn:(UIButton *)sender {
    if (sender.tag==2) {
        CCDeptMainViewController *se  = [CCDeptMainViewController new];
        se.isDoc = YES;
        [self.navigationController pushViewController:se animated:YES];
    }else
    {
        CCDeptMainViewController *dept = [CCDeptMainViewController new];
        [self.navigationController pushViewController:dept animated:YES];
    }
    
    
}
//#pragma mark -- 按疾病
//- (IBAction)jiBinBtn:(UIButton *)sender {
//    CCBaseDocInfoViewController *base = [CCBaseDocInfoViewController new];
//    [self.navigationController pushViewController:base animated:YES];
//}

/**
 *  设置导航栏
 */
-(void)setNavBar
{   //添加导航栏左边的菜单按钮和点击事件
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"菜单"] style:UIBarButtonItemStylePlain target:self action:@selector(menuBarClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"信息"] style:UIBarButtonItemStylePlain target:self action:@selector(messageBarClick)];
    self.navigationItem.title = @"114快医";
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:nil];
    
}

#pragma mark -- 点击个人中心调用
- (void)menuBarClick_CC
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userCenterInfoClick:) name:@"menu" object:nil];
}

- (void)userCenterInfoClick:(NSNotification *)not
{
    WJJFinishSubmitViewController *wjj = not.userInfo[@"controller"];
    [wjj.navigationController popToViewController:self animated:YES];
    [self menuBarClick];
}
/**
 *  菜单按钮的点击事件
 */
-(void)menuBarClick
{

    //获取主窗口的根控制器
    MMDrawerController *drawer = (MMDrawerController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    //点击侧滑0
    [drawer toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
/**
 *  消息按钮的点击事件
 */
-(void)messageBarClick
{
   OnLine
    
    RightViewController *rightVC = [[RightViewController alloc]init];
    
    [self.navigationController pushViewController:rightVC animated:YES];
    
}

/**
 *  疾病选择按钮的点击事件
 */
- (IBAction)jiBingXuanZhe:(UIButton *)sender
{
    OnLine
    
    XQMingYiTongViewController *mingYiVC = [XQMingYiTongViewController new];
    mingYiVC.illnessname = sender.titleLabel.text;
    mingYiVC.illness = sender.tag;
    [self.navigationController pushViewController:mingYiVC animated:YES];
}


/**
 *  重写控制器的初始化方法,从storyboard中加载控制器
 *
 *  @return 返回控制器
 */
-(instancetype)init
{
    UIStoryboard *stroy = [UIStoryboard storyboardWithName:@"XQMainTableView" bundle:nil];
    
    return [stroy instantiateViewControllerWithIdentifier:@"Main"];
}




#pragma mark - Table view data source




@end
