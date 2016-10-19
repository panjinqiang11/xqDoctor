//
//  CCDeptMainViewController.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//


/**
 *  选择科室主控制器
 */
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "CCDeptMainViewController.h"
#import "UIImage+CCImg.h"
#import "TitleView.h"
#import "CCTwoLeftTableViewController.h"
#import "Masonry.h"
#import "CCtitleFiled.h"
#import "CCTwoRightTableViewController.h"
#import "hospitalViewController.h"

@interface CCDeptMainViewController ()
@property (nonatomic,weak)UIView *bigView; //组织内容的view
@property (nonatomic , strong) TitleView *titleView;//医院详情
@property (nonatomic ,weak) UITableView* leftView;//左边的tableView
@property (nonatomic ,weak) UITableView* rightView;//右边的tableView
@property (nonatomic , strong)CCtitleFiled *searchFiled;
@property (nonatomic,strong) CCTwoLeftTableViewController *leftController;//左边tableViewController的引用
@property (nonatomic,strong) CCTwoRightTableViewController *rightController;//右边tableViewController的引用
@end

@implementation CCDeptMainViewController

- (void)setIsDoc:(BOOL)isDoc
{
    _isDoc = isDoc;
    self.searchFiled.holderName = @"输入疾病名称查找";

}

- (void)setIsHospital:(BOOL)isHospital
{
    _isHospital = isHospital;
    
    
}

 - (CCtitleFiled *)searchFiled
{
    if (!_searchFiled) {
        _searchFiled = [[CCtitleFiled alloc] initWithFrame:CGRectMake(60, 10, 250, 30)];
        _searchFiled.borderStyle = UITextBorderStyleRoundedRect;
        UIImage *images = [UIImage imageNamed:@"搜索"];
        images = [images scaleToSize:images size:CGSizeMake(30, 30)];
       
        _searchFiled.holderName = @"输入科室名称查找";
        _searchFiled.searchImage = images;
        
    }
    return _searchFiled;
}

//两个tableview的容器
- (UIView *)bigView
{
    if (!_bigView) {
        UIView *views = [[UIView alloc] init];
        [self.view addSubview:views];
        views.backgroundColor = [UIColor whiteColor];
        _bigView = views;
    }
    return _bigView;
}

//左边view 懒加载
- (UITableView *)leftView
{
    if (!_leftView) {
        self.leftController = [[CCTwoLeftTableViewController alloc] init];
        UITableView *left = self.leftController.tableView;
        [self.bigView addSubview:left];

        _leftView = left;
    }
    return _leftView;
}
//右边view的懒加载
- (UITableView *)rightView
{
    if (!_rightView) {
        self.rightController = [[CCTwoRightTableViewController alloc] init];
        self.rightController.mainCon = self;
        self.rightController.hosCon = self.rightController;
        NSLog(@"%p",self.rightController);
        self.rightController.isHospital = self.isHospital;
        UITableView *right = self.rightController.tableView;
        [self.bigView addSubview:right];
        
        _rightView = right;
    }
    return _rightView;
}

//点击导航栏返回按钮的事件
- (void)backDept
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStyleDone target:self action:@selector(backDept)];
  
    
    //设置导航栏的标题
    [self setNavBarTitle];
    
    [self addTitleViewToWindow];
    
    
    [self leftView];
    [self rightView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark -- 设置当前外层view
- (void)prepareView
{
    self.bigView.frame = CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-80);
}

#pragma mark -- 设置navBar的title
- (void)setNavBarTitle
{
    //设置title
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//    label.text = @"选择科室";
//    label.textAlignment = NSTextAlignmentCenter;
//    [label setTextColor:[UIColor whiteColor]];
//    self.navigationItem.titleView = label;
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationItem.titleView = self.searchFiled;

}



#pragma mark -- 在window上添加view
- (void)addTitleViewToWindow
{
   // UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.titleView = [[TitleView alloc] init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dicInfo)];
    [ self.titleView.descriptionLabel addGestureRecognizer:tap];
    self.titleView.descriptionLabel.userInteractionEnabled = YES;
    self.titleView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80);
    //添加到window上
    [self.view addSubview:self.titleView];
    
   
}

- (void)dicInfo
{
    hospitalViewController *hos = [[hospitalViewController alloc]init];
    [self.navigationController pushViewController:hos animated:YES];
}

#pragma mark -- view即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:NO];
    
    [self.titleView removeFromSuperview];
    
}

#pragma mark -- 将要布局子控件
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self prepareView];
    __block CGFloat w = self.bigView.frame.size.width*0.7;
    [self.rightView makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.bigView);
        make.width.equalTo(w);
    }];
    __block CGFloat ws = self.bigView.frame.size.width*0.3;
    [self.leftView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.bottom.equalTo(self.bigView);
        make.width.equalTo(ws);
        
    }];
    [self addTitleViewToWindow];
}





@end
