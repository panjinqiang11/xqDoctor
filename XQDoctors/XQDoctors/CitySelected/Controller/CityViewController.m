//
//  CityViewController.m
//  XQDoctors
//
//  Created by kassia on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CityViewController.h"
#import "cityModel.h"
@interface CityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *cityInfos;
@property (nonatomic,copy) NSString *titleLable;

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
#pragma mark - 懒加载
- (NSArray *)cityInfos{
    if (!_cityInfos) {
        
        //获取数据
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cities.plist" ofType:nil]];
        
        NSMutableArray *arrayM = [[NSMutableArray alloc]init];//可变数组
        
        for (NSDictionary *dict in array) {//遍历字典

            cityModel *model = [cityModel cityWithDict:dict];//创建model
            
            [arrayM addObject:model];//添加到可变数组
        }
        _cityInfos = arrayM;//赋值
    }
    return _cityInfos;
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cityInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *key = @"car";
    
    // 创建Cell(可重用的Cell)
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:key];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key];;
    
    }
    
    cityModel *model = self.cityInfos[indexPath.row];//给model赋值
        
    cell.textLabel.text = model.name;//给textLable赋值
    
    return cell;//返回cell
  

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    cityModel *model = self.cityInfos[indexPath.row];//获取值
    
    self.titleLable = model.name;//赋值
    
    [self.navigationController popViewControllerAnimated:YES];//返回上一控制器

}
- (void)returnTitleByTitleBlock:(TitleBlock)titleBlock{

    if (titleBlock) {
        
        titleBlock(self.titleLable);//block传值给基本资料控制器
    }

}
@end
