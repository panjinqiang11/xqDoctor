//
//  CCBaseDocInfoViewController.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "CCBaseDocInfoViewController.h"
#import "WJJRegisteredInformationVC.h"
#import "UIImage+CCImg.h"
#import "CCDoctorInfoView.h"
#import <Masonry.h>
#import "CCToolView.h"
#import "DJMainViewController.h"


#import "CollectController.h"
@interface CCBaseDocInfoViewController ()
@property (nonatomic,weak)CCDoctorInfoView *doctorInfoView;//描述医生信息
@property (nonatomic ,weak) CCToolView* toolView;//医生简介下面的内容 ；-接诊条件-医生简介-就诊时间
@end

@implementation CCBaseDocInfoViewController

#pragma mark --描述医生信息
- (CCDoctorInfoView *)doctorInfoView
{
    if (!_doctorInfoView) {
        CCDoctorInfoView *doc = [CCDoctorInfoView new];
        [self.view addSubview:doc];
        _doctorInfoView = doc;
        
        
    }
    return _doctorInfoView;
}
#pragma mark --医生简介下面的内容
- (CCToolView *)toolView
{
    if (!_toolView) {
        CCToolView *tool = [CCToolView new];
        [self.view addSubview:tool];
       
        _toolView = tool;
    }
    return _toolView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条
    [self prepareNarBar];
    self.view.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    self.toolView.backgroundColor = [UIColor yellowColor];
    
    [self getNotfactionofGuaHao];
}

#pragma mark -- 接受挂号按钮发来的消息
- (void)getNotfactionofGuaHao
{
//    jumpToWJJinfornation
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpToWJJ) name:@"jumpToWJJinfornation" object:nil];
}

#pragma mark -- 跳转到个人中心
- (void)jumpToWJJ
{
            DJMainViewController *wjjVc = [DJMainViewController new];
            [self.navigationController pushViewController:wjjVc animated:YES];
}

#pragma mark -- 设置导航栏
- (void)prepareNarBar
{
    UIImage *image = [UIImage imageNamed:@"返回小"];
    //缩放图片
    image = [image scaleToSize:image size:CGSizeMake(30, 30)];
    //self.leftImage = image;
    //设置返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
    
    //设置标题
    self.navigationItem.title = @"医生基本信息";
    NSDictionary *textDict = @{
                               NSFontAttributeName:[UIFont systemFontOfSize:17],
                               NSForegroundColorAttributeName:[UIColor whiteColor]
                               };
    [self.navigationController.navigationBar setTitleTextAttributes:textDict];
    //设置右边的星星
    UIImage *rightimage = [UIImage imageNamed:@"CC_star"];
    //缩放图片
    rightimage = [rightimage scaleToSize:rightimage size:CGSizeMake(30, 30)];
    //self.leftImage = image;
    //设置返回按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightimage style:UIBarButtonItemStyleDone target:self action:@selector(collect)];
}

#pragma mark -- 右边星星收藏
- (void)collect
{
    CollectController *CollVc = [CollectController new];
    
    [self.navigationController pushViewController:CollVc animated:YES];
}
#pragma mark -- 返回
- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

# pragma mark -- 布局子控件
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.doctorInfoView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(170.);
    }];
//
    CGFloat h = self.view.frame.size.height - 150 - 20;
    [self.toolView makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.view);
        make.height.equalTo(h);

    }];
}


@end
