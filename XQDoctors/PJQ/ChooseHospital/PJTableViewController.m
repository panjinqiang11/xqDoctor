//
//  PJTableViewController.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PJTableViewController.h"
#import "PJTableViewCell.h"
#import "PJModel.h"
#import "Masonry.h"
#import "AttentionController.h"
#import "BottomView.h"
#import "PJFootView.h"
#import "PJHeadView.h"
#import "WJJRegisteredInformationVC.h"
#import "XQMingYiTongViewController.h"
#import "AdvertiseView.h"
#import "CCHospitalViewController.h"
#import "CalendarViewController.h"

@interface PJTableViewController ()<dnextDay,calendar,appoint>
//模型数组
@property (nonatomic,strong)NSMutableArray *info;
@property (nonatomic,strong)UITableView *MytableView;
@end

@implementation PJTableViewController
//加载头部的tableviw
-(UITableView *)MytableView{
    
    if(!_MytableView) {
        
        _MytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,400)];
        
        [self.view addSubview:_MytableView];
    }
    return  _MytableView;
}

//预约
-(void)appoint{
    
    WJJRegisteredInformationVC *vc =[WJJRegisteredInformationVC new];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置头部tableview
    [self setFirstTableView];
    //添加广告View
    [self setAdvertisement];
    //添加底部的View
    [self setBottomTableView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backVc)];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)backVc{

    [self.navigationController popToRootViewControllerAnimated:YES];


}

#pragma mark - 设置头部tableview
-(void)setFirstTableView{
    
    //设置头部tableview代理
    self.MytableView.delegate = self;
    
    self.MytableView.dataSource = self;
    
    //设置头部tableview的headerView
    PJHeadView *head= [[PJHeadView alloc]init];
    head.delegate= self;
    
    self.MytableView.tableHeaderView = head;
    
    //设置头部tableview的footVieww
    PJFootView *foot = [[PJFootView alloc]init];
    //设置头部tableview的footView代理
    foot.delegate = self;
    
    self.MytableView.tableFooterView = foot;
    
    
    
    //注册头部tableview的cell
    [self.MytableView registerNib:[UINib nibWithNibName:@"PJTableViewCell" bundle:nil] forCellReuseIdentifier:@"choose"];
    
    
}
#pragma mark - 点击日历
- (void)clikCalendar{
    CalendarViewController *calendar = [CalendarViewController new];
    
    // [self presentViewController:calendar animated:YES completion:nil];
    
    [self.navigationController pushViewController:calendar animated:YES];
    
}
#pragma mark - 执行下一日代理方法
- (void)nextDay{
    
    
    PJModel *model = self.info[0];
    
    [self.info replaceObjectAtIndex:1 withObject:model];
    
    [self.MytableView reloadData];
    
}
#pragma mark - 执行上一日代理方法
- (void)lastDay{
    
    PJModel *model = self.info[2];
    
    [self.info replaceObjectAtIndex:1 withObject:model];
    
    [self.MytableView reloadData];
}



#pragma mark -  设置广告view
-(void)setAdvertisement{
    //加载视图
    AdvertiseView *advertisement = [[AdvertiseView alloc]init];
    
    
    
    
    [self.view addSubview:advertisement];
    
    //设置约束
    [ advertisement mas_makeConstraints:^(MASConstraintMaker *make) {
        //上边
        make.top.equalTo(self.MytableView.tableFooterView.mas_bottom);
        //左边
        make.left.equalTo(self.view.mas_left);
        //右边
        make.right.equalTo(self.view.mas_right);
        //高度
        make.height.equalTo(@50);
    }];
    
     __weak typeof(self) weakSelf = self;
    advertisement.btn = ^{
        
        XQMingYiTongViewController *dept = [XQMingYiTongViewController new];
        
        [weakSelf.navigationController pushViewController:dept animated:YES];
        
    };
    
}
#pragma mark - 添加底部的View
-(void)setBottomTableView{
    //创建带tableView的UIView
    BottomView *bottom = [[BottomView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.MytableView.frame)-20,self.view.frame.size.width,500)];
    
    __weak typeof(self) weakSelf = self;
    bottom.jumpVcBlock = ^{
    
        CCHospitalViewController *hospVc = [CCHospitalViewController new];
        [weakSelf.navigationController pushViewController:hospVc animated:YES];
        
    };
    
    //添加底部的View
    [self.view addSubview:bottom];
    
    
}





//懒加载
-(NSMutableArray *)info{
    
    if(!_info) {
        
        _info = [PJModel InfoArr];
    }
    return _info;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    return 3;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choose" forIndexPath:indexPath];
    cell.delegate = self;
    
    //创建model传递数据
    PJModel *model = self.info[indexPath.row];

    cell.model = model;
    
    
    return cell;
}




@end

