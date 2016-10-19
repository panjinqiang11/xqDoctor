//
//  recordManagerController.m
//  XQDoctor
//
//  Created by 任文迪 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "recordManagerController.h"
#import "Masonry.h"
#import "rwdfooterView.h"
#import "PersonDataController.h"
#import "addRecordController.h"
#import "TestheadView.h"
#import "MytestCell.h"
#import "RwdBottomView.h"
#import "DJMainViewController.h"
@interface recordManagerController ()<UITableViewDataSource>

@property(weak,nonatomic)addRecordController *addRecord;

@property(weak,nonatomic)RwdBottomView *btn;

@end

@implementation recordManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    RwdBottomView *bottom = [[RwdBottomView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 100, [UIScreen mainScreen].bounds.size.width, 80)];
//    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    
//    [window addSubview:bottom];
//    
//    self.btn = bottom;
//    
//    addRecordController *jump = [[addRecordController alloc]init];
//    
//    __weak typeof(self) weakself = self;
//    bottom.jumpVcBlock = ^(NSString *str){
//    
//        [weakself.navigationController pushViewController:jump animated:YES];
//        NSLog(@"%@",str);
//        
//    };
    
     __weak typeof(self) weakself = self;
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"rwdRecordManageCell" bundle:nil] forCellReuseIdentifier:@"manager"];
    //添加返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backToRoot)];

    
    TestheadView *test = [[TestheadView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    
    self.tableView.tableHeaderView = test;
    
    ((TestheadView *)self.tableView.tableHeaderView).jump = ^(UIButton *btn){
    
        PersonDataController *personDataVc = [PersonDataController sharedPersonDataController];
        
        [weakself.navigationController pushViewController:personDataVc animated:YES];
    
    };
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Do any additional setup after loading the view.
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.btn.hidden = NO;
    
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.btn.hidden = YES;
}

//返回上级菜单
- (void)backToRoot{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    MytestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    
    if (!cell) {
        
        cell = [[MytestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    
        return cell;

}

#pragma mark -- 添加footerView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    RwdBottomView *bottom = [[RwdBottomView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 100, [UIScreen mainScreen].bounds.size.width, 80)];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window addSubview:bottom];
    
    self.btn = bottom;
    
    addRecordController *jump = [[addRecordController alloc]init];
    
    __weak typeof(self) weakself = self;
    bottom.jumpVcBlock = ^(NSString *str){
        
        [weakself.navigationController pushViewController:jump animated:YES];
        NSLog(@"%@",str);
        
    };
    return self.btn;
}

#pragma mark -- 设置footView的高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80.;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rubysh{
    
    //设置下方的footerview
    /*
     self.tableView.tableFooterView = [rwdfooterView loadNib];
     
     self.view.backgroundColor = [UIColor whiteColor];
     
     ((TestheadView *)self.tableView.tableHeaderView).jump = ^(UIButton *btn){
     
     jump.title = @"修改资料";
     
     NSLog(@"----------%p",jump);
     
     [weakself.navigationController pushViewController:jump animated:YES];
     
     };
     
     
     */
    
    //    //跳转添加病例
    //    ((rwdfooterView *)self.tableView.tableFooterView).jumpToRecord = ^(UIButton *btn){
    //
    //        addRecordController *addRecord = [[addRecordController alloc]init];
    //
    //       //判断是否点击了添加按钮如果点击了返回的时候多一个右侧按钮
    //        addRecord.bacBlock = ^(BOOL argu,NSInteger number){
    //
    //            NSLog(@"1111");
    //
    //            weakself.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:nil action:nil];
    //            weakself.number = number;
    //
    //            [weakself.tableView reloadData];
    //
    //        };
    //
    //        weakself.addRecord = addRecord;
    //
    //        addRecord.title = @"添加病历";
    //
    //        [weakself.navigationController pushViewController:addRecord animated:YES];
    //        
    //        NSLog(@"跳转添加病历了");
    //        
    //    };
    
    
    

    
}

@end
