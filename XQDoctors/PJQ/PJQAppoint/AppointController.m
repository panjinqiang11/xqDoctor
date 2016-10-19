//
//  AppointController.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "AppointController.h"
#import "AppointCell.h"
#import "PJappointModel.h"
#import "AFNetworking.h"
#import "PJTableViewController.h"
@interface AppointController ()
@property (nonatomic,strong)NSArray *infoarr;
@end

@implementation AppointController

-(void)setUrlstring:(NSString *)urlstring{
    _urlstring = urlstring;
    
    
    //将下载返回数据拿到
    __weak typeof(self) weakSelf = self;
    
    [PJappointModel objectWtihUrl:urlstring finishBlock:^(id result) {
        weakSelf.infoarr = result;
        
        [weakSelf.tableView reloadData];
        
    }];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlstring = @"http://192.168.23.42/appoint.json";
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"AppointCell" bundle:nil] forCellReuseIdentifier:@"appoint"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    
    return self.infoarr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppointCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"appoint" forIndexPath:indexPath];
    
    
    PJappointModel *model = self.infoarr[indexPath.row];
    
    
    cell.model = model;
    
    return  cell;
}


@end
