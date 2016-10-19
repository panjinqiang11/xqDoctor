//
//  CollectController.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CollectController.h"
#import "CollectCell.h"
#import "AttentionController.h"
#import "PJCollectModel.h"
#import "CCBaseDocInfoViewController.h"

#import "CCDeptMainViewController.h"
@interface CollectController ()
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,strong)NSArray *infoarr;
@end

@implementation CollectController
-(void)setUrlstring:(NSString *)urlstring{
    _urlstring = urlstring;
    
    
    //将下载返回数据拿到
    __weak typeof(self) weakSelf = self;
    
    NSDictionary *dic = @{@"ci1_id":@1,@"ci2_id":@3,@"ci3_id":@3,@"diagnosis_type":@0,@"page_size":@15,@"is_confirmed":@1,@"user_id":@1000089, @"page":@1,@"has_diagnosis":@2};
    
    [PJCollectModel objectWtihUrl:urlstring dic:dic finishBlock:^(id result) {
        weakSelf.infoarr = result;
        
        [weakSelf.tableView reloadData];
        
        
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //根据ID创建cell 给定默认值
    self.ID = @"collect";
    self.urlstring = @"http://iosapi.itcast.cn/doctor/matchDoctors.json.php";
    
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"CollectCell" bundle:nil] forCellReuseIdentifier:@"collect"];
    [self.tableView registerNib:[UINib nibWithNibName:@"AttentionCell" bundle:nil] forCellReuseIdentifier:@"attention"];
    //创建segmentController
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc] initWithFrame:CGRectMake(80.0f, 8.0f, 200.0f, 30.0f) ];
    //按照索引添加标题
    [segmentedControl insertSegmentWithTitle:@"关注的医生" atIndex:0 animated:YES];
    [segmentedControl insertSegmentWithTitle:@"关注的医院" atIndex:1 animated:YES];
    //添加点击方法
    [segmentedControl addTarget:self action:@selector(Selectbutton:) forControlEvents:UIControlEventValueChanged];
    //设置默认的cell
    segmentedControl.selectedSegmentIndex = 0;
    
    
    
    
    self.navigationItem.titleView = segmentedControl;
    //添加返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
}
#pragma mark - 点击segment切换页面
-(void)Selectbutton:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
            //点击关注的医生
        case 0:
        {
            self.ID = @"collect";
            
            [self.tableView reloadData];
        }
            break;
            //点击关注的医院
        case 1:
        {
            self.ID = @"attention";
            
            [self.tableView reloadData];
            
        }
            break;
            
            
    }
}

//返回方法
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    if([self.ID isEqualToString:@"attention"]){
        return 8;
    }else{
        return self.infoarr.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectCell *cell = [tableView dequeueReusableCellWithIdentifier:self.ID forIndexPath:indexPath];
    if([self.ID isEqualToString:@"collect"]){
        PJCollectModel *model=  self.infoarr[indexPath.row];
        
        
        
        
        cell.model = model;
        return cell;
    }else
        
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([self.ID isEqualToString:@"collect"]){
    
        CCBaseDocInfoViewController *baseVc = [CCBaseDocInfoViewController new];
        [self.navigationController pushViewController:baseVc animated:YES];
    
    }else{
        CCDeptMainViewController *dept = [CCDeptMainViewController new];
    
        [self.navigationController pushViewController:dept animated:YES];
        
    }


}


@end
