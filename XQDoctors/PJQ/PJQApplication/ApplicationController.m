//
//  ApplicationController.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "ApplicationController.h"
#import "ApplicationCell.h"
#import "ApplicationModel.h"
#import "PJTableViewController.h"
#import "DatesDetialController.h"//预约详情控制器
@interface ApplicationController ()
@property (nonatomic,strong)NSArray *info;
@end

@implementation ApplicationController
//懒加载
-(NSArray *)info{
    
    if(!_info) {
        
        _info = [ApplicationModel info];
    }
    return _info;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"ApplicationCell" bundle:nil] forCellReuseIdentifier:@"application"];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
}



- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}

 #pragma mark - 点击cell跳转页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取模型
    ApplicationModel *model = self.info[indexPath.row];
    
    //跳转控制器
    //创建控制器
    DatesDetialController *dateController = [[DatesDetialController alloc]init];
    //push控制器
    [self.navigationController pushViewController:dateController animated:YES];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    dateController.appLable = model.application;
   
    
    
}
   



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.info.count;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ApplicationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"application" forIndexPath:indexPath];
    
    ApplicationModel *model = self.info[indexPath.row];
    
    cell.model = model;
    //判断申请的状态
    if([model.application isEqualToString:@"已就诊"]){
        //如果是已就诊状态就显示灰色的申请
        cell.check.backgroundColor = [UIColor grayColor];
        
    }else if([model.application isEqualToString:@"申请失败"]){
        
        cell.check.backgroundColor = [UIColor colorWithRed:(255 / 255.0) green:(189 / 255.0) blue:(205 / 255.0) alpha:1.0];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(cell.contentView.frame.size.width-13,5,12,12)];
        
        img.image = [UIImage imageNamed:@"u90"];
        //如果申请失败,在右上角添加红色小圈
        [cell.contentView addSubview:img];
        
    }
        
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
