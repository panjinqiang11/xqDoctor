//
//  PayController.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PayController.h"
#import "PayCell.h"
@interface PayController ()

@end

@implementation PayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册xib
    [self.tableView registerNib:[UINib nibWithNibName:@"PayCell" bundle:nil] forCellReuseIdentifier:@"pay"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pay" forIndexPath:indexPath];
    if(indexPath.row == 1){
        
        cell.changeLabel.text = @"锦旗" ;
        cell.price.text = [NSString stringWithFormat:@"-49.00"];
        
    }else if(indexPath.row) {
        
        cell.changeLabel.text = @"101咨询服务" ;
        cell.price.text = [NSString stringWithFormat:@"-49.00"];
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
