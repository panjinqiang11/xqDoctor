//
//  rwdSettingController.m
//  XQDoctor
//
//  Created by 任文迪 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//
#import "feedBackController.h"
#import "rwdSettingController.h"
#import "rwdTableViewCell.h"
#import "settingModel.h"
#import "headView.h"
#import "recordManagerController.h"
#import "AppointController.h"
#import "ApplicationController.h"
#import "CollectController.h"
#import "PayController.h"
#import "HelpController.h"
#import "PersonDataController.h"
#import <UIViewController+MMDrawerController.h>
#import "EnterTools.h"
#import "loginHeadView.h"
#import "WJJEnterViewController.h"
#import "WJJRegisterViewController.h"


@interface rwdSettingController ()

@property(strong,nonatomic)NSArray *modelArr;
@property (nonatomic, strong) UINavigationController *navigationVC;
@property (strong,nonatomic)loginHeadView *loginView;
@property (nonatomic, copy) NSString *plistName;
@end

@implementation rwdSettingController
/**
 *  个人基本资料
 */
- (IBAction)personBtn:(UIButton *)sender {
    //创建控制器
    PersonDataController *controller = [PersonDataController sharedPersonDataController];
    //导航栏
    //push控制器
    [self.navigationVC pushViewController:controller animated:NO];
    //关闭打开的侧栏
    [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
 
}

//- (void)viewWillAppear:(BOOL)animated{
//
//    [super viewWillAppear:animated];
//    
//    EnterTools *enter = [EnterTools sharedIsEnter];
//    if (enter.isOnline){
//        
//        self.tableView.tableHeaderView = [headView loadNibWithNibName:@"headView"];
//    }else{
//        
//        self.tableView.tableHeaderView = [headView loadNibWithNibName:@"LoginHead"];
//        
//    }
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"rwdTableViewCell" bundle:nil] forCellReuseIdentifier:@"abc"];
//
    EnterTools *enter = [EnterTools sharedIsEnter];
    
    if (enter.isOnline){
        
         self.tableView.tableHeaderView = [headView loadNibWithNibName:@"headView"];
         self.plistName = @"settings";
        
    }else{
        
        self.tableView.tableHeaderView = [headView loadNibWithNibName:@"LoginHead"];
        self.plistName = @"Login";
    }
    
 
   
    [self loadheader];
    //获取中间的导航控制器
    UINavigationController *nav = (UINavigationController *)self.mm_drawerController.centerViewController;
    //赋值给属性
    self.navigationVC = nav;
    
    //跳转登录或者注册
    [self LoginOrRegister];
}


-(void) loadheader
{
    self.modelArr = nil;
    EnterTools *enter = [EnterTools sharedIsEnter];
    
    if (enter.isOnline){
        
        self.tableView.tableHeaderView = [headView loadNibWithNibName:@"headView"];
        
        self.plistName = @"settings";
    }else{
        
        self.tableView.tableHeaderView = [headView loadNibWithNibName:@"LoginHead"];
        self.plistName = @"Login";
    }
    [self.tableView reloadData];
    
}

//登录或注册
- (void)LoginOrRegister{

    //self.loginView = [[loginHeadView alloc]init];
    __weak typeof(self) weakself = self;
    ((loginHeadView *)self.tableView.tableHeaderView).loginBlock = ^(NSInteger index){
    
        if (index == 0) {
            
            WJJRegisterViewController *regView = [[WJJRegisterViewController alloc]init];
            [weakself.navigationVC pushViewController:regView animated:NO];
            [weakself.mm_drawerController closeDrawerAnimated:YES completion:nil];
            
        }else{
             //
            WJJEnterViewController *regView = [[WJJEnterViewController alloc]init];
            [weakself.navigationVC pushViewController:regView animated:NO];
            [weakself.mm_drawerController closeDrawerAnimated:YES completion:nil];

        }
    
    };

}


-(NSArray *)modelArr{
    
    if (!_modelArr) {
        
            _modelArr = [settingModel settingModelsWithPlistName:self.plistName];
    }
    
    return _modelArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"%ld",self.modelArr.count);
    return self.modelArr.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    rwdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc" forIndexPath:indexPath];
    
    settingModel *model = self.modelArr[indexPath.row];
    
    cell.model = model;
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.row==0) {
//        return 80;
//    }
    return 60;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    settingModel *model = self.modelArr[indexPath.row];
    
    if ([model.targetVc isEqualToString:@"feedBackController"]) {
        
        feedBackController *feed = [[feedBackController alloc]init];
        
        //push控制器
        [self.navigationVC pushViewController:feed animated:NO];
        //关闭打开的侧栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        feed.title = model.title;

        
        
    }else if([model.targetVc isEqualToString:@"recordSetting"]){
        
        recordManagerController *record = [[recordManagerController alloc]init];
        
        //push控制器
        [self.navigationVC pushViewController:record animated:NO];
        //关闭打开的侧栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        record.title = model.title;
        
       
        
    }else if([model.targetVc isEqualToString:@"AppointController"]){
        
        AppointController *record = [[AppointController alloc]init];
        
        //push控制器
        [self.navigationVC pushViewController:record animated:NO];
        //关闭打开的侧栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        record.title = model.title;
        
    }else if([model.targetVc isEqualToString:@"ApplicationController"]){
        
        ApplicationController *record = [[ApplicationController alloc]init];
        //push控制器
        [self.navigationVC pushViewController:record animated:NO];
        //关闭打开的侧栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        record.title = model.title;
        
    }else if([model.targetVc isEqualToString:@"PayController"]){
        
        PayController *record = [[PayController alloc]init];
        
        //push控制器
        [self.navigationVC pushViewController:record animated:NO];
        //关闭打开的侧栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        record.title = model.title;
        
    }else if([model.targetVc isEqualToString:@"HelpController"]){
        
        HelpController *record = [[HelpController alloc]init];
        //push控制器
        [self.navigationVC pushViewController:record animated:NO];
        //关闭打开的侧栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        record.title = model.title;
        
    }else if([model.targetVc isEqualToString:@"CollectController"]){
        
        CollectController *record = [[CollectController alloc]init];
        //push控制器
        [self.navigationVC pushViewController:record animated:NO];
        //关闭打开的侧栏
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        
    }
  
    
    
    
}


@end
