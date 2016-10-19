//
//  CCHospitalViewController.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "CCHospitalViewController.h"
#import "UIImage+CCImg.h"
#import "Masonry.h"
#import "CCtitleFiled.h"
#import "CCHospitalHeaderView.h"
#import "CCHospitalCell.h"

#import "DoctorSelectController.h"
#import "CCDeptMainViewController.h"
#import "PJTableViewController.h"

@interface CCHospitalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)CCtitleFiled *searchFiled;
@property (nonatomic ,strong) UIImage *leftImage;
@property (nonatomic , strong)CCDeptMainViewController *dept;
@property (nonatomic,strong) CCHospitalHeaderView *header;
@end

@implementation CCHospitalViewController


- (CCtitleFiled *)searchFiled
{
    if (!_searchFiled) {
        _searchFiled = [[CCtitleFiled alloc] initWithFrame:CGRectMake(60, 10, 250, 30)];
        _searchFiled.borderStyle = UITextBorderStyleRoundedRect;
        UIImage *images = [UIImage imageNamed:@"搜索"];
        images = [images scaleToSize:images size:CGSizeMake(30, 30)];
        _searchFiled.holderName = @"输入医院名称查找";
        _searchFiled.searchImage = images;
        
    }
    return _searchFiled;
}


//- (CCHospitalHeaderView *)header
//{
//    if (!_header) {
//        _header = [[CCHospitalHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
//        _header.alpha = 0.8;
//        
//    }
//    return _header;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self prapareNavBar];
//    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    //[self addHeaderViewForTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"CCHospitalCell" bundle:nil] forCellReuseIdentifier:@"CCHospitalCell"];
   //清除滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;

    [self.tableView registerClass:[CCHospitalHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
}

#pragma mark -- 设置导航条的内容
- (void)prapareNavBar
{

   //设置返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStyleDone target:self action:@selector(goBack)];
    
    
   //设置title搜索
    
    self.navigationItem.titleView = self.searchFiled;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CCHospitalHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    header.backgroundColor = [UIColor redColor];
    return header;
}



#pragma mark -- 返回按钮
- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

# pragma mark -- 添加headerView
- (void)addHeaderViewForTableView
{
    if (self.header==nil) {
        self.header = [[CCHospitalHeaderView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
        self.header.alpha = 0.8;
        [[UIApplication sharedApplication].keyWindow addSubview:self.header];

    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCHospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CCHospitalCell"];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.;
}

#pragma mark -- 点击cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isDept == YES) {
        PJTableViewController *dic = [PJTableViewController new];
        [self.navigationController pushViewController:dic animated:YES];
    }else
    {
        //跳转到"选择科室"
        CCDeptMainViewController *dept = [[CCDeptMainViewController alloc] init];
        dept.isHospital = YES;
        dept.image = self.leftImage;
        [self.navigationController pushViewController:dept animated:YES];
    }
    
}

#pragma mark -- view即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:NO];
    
//    [self.header removeFromSuperview];
//    [self.header removeFromSuperview];
//    self.header = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];

    //[self addHeaderViewForTableView];
    
}
@end
