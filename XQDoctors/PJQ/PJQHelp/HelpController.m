//
//  HelpController.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "HelpController.h"
#import "EnterTools.h"
#import "Masonry.h"
#import "rwdSettingController.h"
#import <UIViewController+MMDrawerController.h>
@interface HelpController ()
@property (nonatomic,strong)NSArray *info;
@end

@implementation HelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFoot];
    
    //添加返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
}
//返回方法
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}


//创建footView
-(void)addFoot{
//    //创建footView
//    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-100, 100, 300)];
//    //创建注销按钮
//    UIButton *but = [[UIButton alloc]init];
//    
//    [foot addSubview:but];
//    
//    [but setTitle:@"注销" forState:UIControlStateNormal];
//    
//    but.backgroundColor = [UIColor grayColor];
//    //设置button约束
//    [but mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(foot.mas_right).offset(-20);
//        
//        make.left.equalTo(foot.mas_left).offset(20);
//        
//        make.bottom.equalTo(foot.mas_bottom).offset(20);
//    }];
//    
//    
//    
//    self.tableView.tableFooterView = foot;
    
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setTitle:@"注销" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
    
    [self.view addSubview:btn];
    
    btn.frame = CGRectMake(20,[UIScreen mainScreen].bounds.size.height-130, [UIScreen mainScreen].bounds.size.width-40, 50);
    
    [btn addTarget:self action:@selector(cancelBtn) forControlEvents:UIControlEventTouchDown];
}

//注销登录
- (void)cancelBtn{

    EnterTools *enter = [EnterTools sharedIsEnter];

    enter.isOnline = NO;
    
    [(rwdSettingController *)self.mm_drawerController.leftDrawerViewController loadheader];
    [(rwdSettingController *)self.mm_drawerController.leftDrawerViewController LoginOrRegister];
    [self.navigationController popViewControllerAnimated:YES];
      
}

//懒加载
-(NSArray *)info{
    
    if(!_info) {
        
        NSString *paths = [[NSBundle mainBundle] pathForResource:@"PJHelp" ofType:@"plist"];

        _info = [NSArray arrayWithContentsOfFile:paths];
    }
    return  _info;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    // 1.获取组
    NSDictionary *group = self.info[section];
    
    // 2.获取这个组中所有的Cell
    NSArray *items = group[@"items"];
    
    // 3.返回Cell的个数
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.取出数据
    // 获取组
    NSDictionary *group = self.info[indexPath.section];
    // 获取这个组中所有的Cell
    NSArray *items = group[@"items"];
    // 获取一个Cell的信息
    NSDictionary *item = items[indexPath.row];
    
    // 2.创建Cell
    static NSString *ID = @"setting_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    
    // 3.设置数据
    cell.textLabel.text = item[@"title"];
    // 获取accessoryType
    NSString *accessoryType = item[@"accessoryType"]; //UIImageView
    // 根据字符串创建类
    Class class = NSClassFromString(accessoryType);
    // 根据类实例化对象
    UIView *accessoryView = [[class alloc] init];
    // 判断是否是UIImageView
    if ([accessoryView isKindOfClass:[UIImageView class]]) {
        // 强转成UIImageView
        UIImageView *imgView = (UIImageView *)accessoryView;
        // 设置ImgView的图片
        imgView.image = [UIImage imageNamed:@"右箭头"];
        // 自适应大小
        [imgView sizeToFit];
    }
    
    cell.accessoryView = accessoryView;
    
    // 4.返回Cell
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
