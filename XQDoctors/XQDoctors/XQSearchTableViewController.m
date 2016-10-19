//
//  XQSearchTableViewController.m
//  XQDoctor
//
//  Created by 张清 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "XQSearchTableViewController.h"
#import "UIView+Frame.h"
#import "illnessModel.h"
#import "SyndromeModel.h"
@interface XQSearchTableViewController ()
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, copy) NSString *illnessName;
@property (nonatomic, strong) NSMutableDictionary *stringDic;
@end


@implementation XQSearchTableViewController

- (NSMutableDictionary *)stringDic
{
    if (!_stringDic)
    {
        _stringDic = [NSMutableDictionary dictionary];
    }
    return _stringDic;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBar];
    [self loadData];
    //判断是不是点的疾病细分按钮不是 就进入编辑模式
    if (self.isJiBingXiFen == NO)
    {
        [self setEditing:YES animated:NO];
    }
    
    
}

-(void)loadData
{
    __weak typeof (self) weakSelf = self;
    if (self.isJiBingXiFen)
    {
        NSString *urlStr = @"searchCI3List.json.php";
        [illnessModel dataArrwithWithURLString:urlStr paramDict:self.param completeBlock:^(NSArray *dataArr) {
            weakSelf.dataArr = dataArr;
            [weakSelf.tableView reloadData];
        }];
    }
    else
    {
        NSString *urlStr = @"complicationList.json.php";
        NSDictionary *param = @{
                                @"page":@1,
                                @"page_size":@15,
                                @"ci2_id":@3
                                };
        [SyndromeModel dataArrwithWithURLString:urlStr paramDict:param completeBlock:^(NSArray *dataArr) {
            weakSelf.dataArr = dataArr;
            [weakSelf.tableView reloadData];
        }];
    }
    
}


-(void)setNavBar
{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    if (self.isJiBingXiFen == NO)
    {
        self.navigationItem.title = @"选择并发症";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(sureClick)];
    }
    else
    {
        self.navigationItem.title = @"选择详细病情";
    }
    
    
}
//确定按钮
-(void)sureClick
{
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
}



//返回按钮
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *key = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:key];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key];
    }
    
    if (self.isJiBingXiFen)
    {
        illnessModel *model = self.dataArr[indexPath.row];
        cell.textLabel.text = model.ci3_name;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else
    {
        SyndromeModel *model = self.dataArr[indexPath.row];
        cell.textLabel.text = model.complication_name;
    }
    
    
    return cell;
}

-(void)retureIllnessNameByIllnessBlock:(IllnessBlock)illnessBlock
{
    if (illnessBlock)
    {
        illnessBlock(self.illnessName);
    }
}


//cell的编辑模式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.isJiBingXiFen)
    {
        illnessModel *model = self.dataArr[indexPath.row];
        self.illnessName = model.ci3_name;
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        SyndromeModel *model = self.dataArr[indexPath.row];
        [self.stringDic setObject:model forKey:model.complication_name];
        
    }
    
}


-(void)retureSyndromeNameBySyndromeBlock:(SyndromeBlock)syndromeBlock
{
    if (syndromeBlock)
    {
        syndromeBlock(self.stringDic);
    }
}



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SyndromeModel *model = self.dataArr[indexPath.row];
    [self.stringDic removeObjectForKey:model.complication_name];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UISearchBar *searchView = [[UISearchBar alloc]init];
    return searchView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
@end
