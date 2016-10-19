//
//  hospitalViewController.m
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "hospitalViewController.h"
#import "hospitalModel.h"
#import "hospitalCell.h"

@interface hospitalViewController ()

@property(strong,nonatomic)NSArray *modelArr;

@end

@implementation hospitalViewController


-(NSArray *)modelArr{
    
    if (!_modelArr) {
        
        _modelArr = [hospitalModel hospitals];
        
    }
    
    return _modelArr;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 100;
    
//    self.tableView.translatesAutoresizingMaskIntoConstraints = YES;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.navigationItem.title = @"医院详情";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backVc)];
    self.tableView.tableHeaderView = [[NSBundle mainBundle] loadNibNamed:@"RwdHospitalHeadView" owner:nil options:nil].lastObject;

}

- (void)backVc{

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.modelArr.count;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    hospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    
    if (!cell) {
        
    cell = [[hospitalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
        
    }
    
    hospitalModel *model = self.modelArr[indexPath.row];
    
    cell.model = model;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 100;
    
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
