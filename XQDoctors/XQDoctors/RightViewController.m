//
//  ViewController.m
//  首页右侧
//
//  Created by li on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "RightViewController.h"
#import "tongziViewCell.h"
#import <Masonry.h>

@interface RightViewController ()


@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //左侧返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backViewController)];
    //title设置
    [self.tableView registerNib:[UINib nibWithNibName:@"tongziViewCell" bundle:nil] forCellReuseIdentifier:@"notifyCell"];
    self.navigationItem.title = @"系统通知";
    
}

- (void)backViewController{

    [self.navigationController popToRootViewControllerAnimated:YES];

}
//设置区域数
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
    
}

//设置cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    tongziViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notifyCell" forIndexPath:indexPath];

    if (indexPath.row == 0){
    
        UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u90"]];
        
        [cell addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell.mas_right).offset(-3);
            make.top.equalTo(cell.mas_top).offset(3);
            make.width.height.equalTo(@15);
        }];
        
        cell.notifyTitleLable.text = @"新增医院通知";
        cell.notifyTextLable.text = @"新增可挂号医院:北京协和医院,北京大兴区妇幼保健医院,北京协和医院,北京大兴区妇幼保健医院,北京协和医院,北京大兴区妇幼保健医院,北京协和医院,北京大兴区妇幼保健医院";
  
    }else{
    
        cell.notifyTitleLable.text = @"停诊通知";
        cell.notifyTextLable.text = @"新增可挂号医院:北京协和医院,北京大兴区妇幼保健医院,北京协和医院,北京大兴区妇幼保健医院,北京协和医院,北京大兴区妇幼保健医院,北京协和医院,北京大兴区妇幼保健医院";

    }

    return cell;

}

//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;

}




@end
