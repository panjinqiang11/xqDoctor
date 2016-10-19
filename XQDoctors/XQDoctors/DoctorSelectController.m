//
//  DoctorSelectController.m
//  XQDoctors
//
//  Created by li on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "DoctorSelectController.h"
#import "DoctorSelectCell.h"
#import "CCBaseDocInfoViewController.h"
#import "DoctorSelectModel.h"

@interface DoctorSelectController ()
@property (nonatomic, strong) NSArray *dataInfos;
@property (nonatomic, copy) NSString *strUrl;

@end

@implementation DoctorSelectController

//strurl的set方法,在这里传递参数给model再到网络工具,
- (void)setStrUrl:(NSString *)strUrl{
 
    _strUrl = strUrl;
    
    NSDictionary *dict = @{@"ci1_id":@1,@"ci2_id":@3,@"ci3_id":@3,@"diagnosis_type":@0,@"page_size":@15,@"is_confirmed":@1,@"user_id":@1000089, @"page":@1,@"has_diagnosis":@2};
    
    __weak typeof(self) weakself = self;
    [DoctorSelectModel modelWithUrl:strUrl andParam:dict andfinishBlock:^(NSArray *infosArr) {
        
        weakself.dataInfos = infosArr;
        
        [weakself.tableView reloadData];
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.strUrl = @"http://iosapi.itcast.cn/doctor/matchDoctors.json.php";
    
    self.tableView.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];

    self.navigationItem.title = @"医生选择";
    //加载xib设置tableView
    [self.tableView registerNib:[UINib nibWithNibName:@"DoctorSelectCell" bundle:nil] forCellReuseIdentifier:@"DocSelectCell"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backVc)];
    
}

- (void)backVc{

    //返回上层控制器
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataInfos.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctorSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DocSelectCell" forIndexPath:indexPath];
    //传数据到cell的model中给控件赋值
    DoctorSelectModel *model = self.dataInfos[indexPath.section];
    
    cell.model = model;
    
    return cell;
}

//点击cell跳转控制器
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    CCBaseDocInfoViewController *baseVc = [CCBaseDocInfoViewController new];
    [self. navigationController pushViewController:baseVc animated:YES];

}


//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;

}
//组间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10;

}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 20;
//
//}


@end
