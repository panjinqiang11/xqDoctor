//
//  WJJRegisterViewController.m
//  XQDoctor
//
//  Created by whitcast on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "WJJRegisterViewController.h"
#import "WJJRegisterTwoViewController.h"
#import "XQBaseButton.h"
#import <Masonry.h>
#import "CityViewController.h"
@interface WJJRegisterViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *ID;
@property (weak, nonatomic) IBOutlet UITextField *address;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *testNumber;

@property (weak, nonatomic) IBOutlet UIButton *IDType;
@property (weak, nonatomic) IBOutlet UIButton *sex;
@property (weak, nonatomic) IBOutlet UIButton *sex2;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *adressSelected;//选择城市按钮
@property (weak,nonatomic) UIView *coverView;//覆盖的view
@property (weak,nonatomic) UIView *mesView;//弹框view
@property (weak,nonatomic) CityViewController *cityController;//城市选择控制器
@end

@implementation WJJRegisterViewController
/**
 *  即将出现的时候调用---生命周期
 */
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //block回调传值
    [self.cityController returnTitleByTitleBlock:^(NSString *title) {
        
        self.address.text = title;
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"用户注册";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(returnButton)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"1/2" style:UIBarButtonItemStylePlain target:nil action:nil];
   
   
    
    //设置5个textField的左边图标
    [self textFieldleftImageWithImageName:@"u16" andTextField:self.name];
    [self textFieldleftImageWithImageName:@"u20" andTextField:self.ID];
    
    [self textFieldleftImageWithImageName:@"u86" andTextField:self.address];
    [self textFieldleftImageWithImageName:@"u24" andTextField:self.phoneNumber];
    [self textFieldleftImageWithImageName:@"u28" andTextField:self.testNumber];

    //开始先隐藏按钮
    self.sex2.hidden = YES;
   
}
/**
 *  选择居住地址按钮
 */
- (IBAction)adressSelected:(UIButton *)sender {
    
    CityViewController *controller = [[CityViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
    
    self.cityController = controller;
}

/**
 *  设置textField 左边图标的方法
 */
- (void)textFieldleftImageWithImageName:(NSString *)imageName andTextField:(UITextField *)textField{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, textField.frame.size.height/2, textField.frame.size.height-10)];
    
    imageView.image = [UIImage imageNamed:imageName];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, textField.frame.size.height, textField.frame.size.height)];
    
    [view addSubview:imageView];
    
    textField.leftView = view;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
}


//选择性别按钮1 点击显示按钮2
- (IBAction)chooseSex:(UIButton *)sender {
    
    self.sex2.hidden = !self.sex2.hidden;
    
}
//选择性别按钮2 点击隐藏按钮2 并与按钮1换值
- (IBAction)chooseSex2:(UIButton *)sender {
    
    sender.hidden = YES;
    NSString *str = self.sex.titleLabel.text;
    self.sex.titleLabel.text = self.sex2.titleLabel.text;
    self.sex2.titleLabel.text = str;
}

//返回按钮
- (void)returnButton{
    
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  跳转到注册第二页
 */
- (IBAction)next:(UIButton *)sender {
    
    if (self.name.text.length>0 && self.ID.text.length>0 && self.address.text.length>0 && self.phoneNumber.text.length>0 && self.testNumber.text.length > 0) {
        
        //创建注册的第二个控制器
        WJJRegisterTwoViewController *registerTwoVC = [WJJRegisterTwoViewController new];
        
        registerTwoVC.array = @[self.name.text,self.IDType.titleLabel.text,self.ID.text,self.address.text,self.phoneNumber.text];
        
        [self.navigationController pushViewController:registerTwoVC animated:YES];//跳转注册2
        
        
    }else{
        
        //添加弹框消息
        [self creatView];
        
        UIView *coverView = [[UIView alloc]init];// 创建view
        
        coverView.frame = [UIScreen mainScreen].bounds;//设置frame
        
        [coverView setBackgroundColor:[UIColor lightGrayColor]];//设置颜色
        
        coverView.alpha = 0;
        
        CGFloat animationDuration = 1.0;//时间
        
        CGFloat alphaNumber = 0.7;
        
       
        // 动画 设置属性
        [UIView animateWithDuration:animationDuration animations:^{
            
            coverView.alpha = alphaNumber;// 动画 设置透明度
        }];
        
        
        [self.view addSubview:coverView];// 添加到界面上
        
        self.coverView = coverView;//赋值给全局控制器
        
        // 父控件调用这个方法 把某个子控件 移动到 最顶层(相对于他的兄弟控件)
        [self.view bringSubviewToFront:self.mesView];

    }
}
/**
 *  创建弹框view
 */
- (void)creatView{

    UIView *mesView = [[UIView alloc]init];//创建弹框view
    
    mesView.frame = CGRectMake(100, 150, 200, 230);//设置frame
    
    mesView.backgroundColor = [UIColor whiteColor];//设置颜色
    
    [self.view addSubview:mesView];//添加到界面
    
    self.mesView = mesView;//赋值给全局变量
    
    
    [self creatTitleAndDetailLable];//创建两个lable
    
    [self creatAgainWriteBtn];//创建重新填写的按钮
    
    
}
/**
 *
 *创建title 和detailLable
 */
- (void)creatTitleAndDetailLable{

    UILabel *titleLable = [[UILabel alloc]init];//创建title
    
    titleLable.text = @"信息填写不完整";//赋值
    
    titleLable.frame = CGRectMake(30, 0, 150, 50);//设置frame
    
    titleLable.font = [UIFont systemFontOfSize:20];//设置字体大小
    
    titleLable.textColor = [UIColor colorWithRed:(255 / 255.0) green:(189 / 255.0) blue:(205 / 255.0) alpha:1.0];
    
    [self.mesView addSubview:titleLable];//添加到界面
    
    UILabel *detailLable = [[UILabel alloc]init];//创建副title
    
    detailLable.text = @"亲,您的信息填写不完整,请重新填写噢~";//赋值
    
    detailLable.font = [UIFont systemFontOfSize:15];//设置字体大小
    
    detailLable.numberOfLines = 2;
    
    detailLable.textColor = [UIColor lightGrayColor];//设置颜色
    
    detailLable.frame = CGRectMake(25, 50, 150, 50);//设置frame
    
    [self.mesView addSubview:detailLable];//添加到界面
    

}
/**
 *  创建重新填写的按钮
 *
 */
- (void)creatAgainWriteBtn{

    UIButton *againBtn = [[UIButton alloc]init];//创建button
    
    againBtn.frame = CGRectMake(20, 150, 150, 40);//设置frame
    
    [againBtn setTitle:@"重新填写" forState:UIControlStateNormal];//设置文字
    
    [againBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置文字颜色
    
    againBtn.backgroundColor = [UIColor colorWithRed:(145 / 255.0) green:(148 / 255.0) blue:(162 / 255.0) alpha:1.0];
    
    [againBtn addTarget:self action:@selector(againAction) forControlEvents:UIControlEventTouchDown];
    
    [self.mesView addSubview:againBtn];
    
    

}
/**
 *  againAction点击事件
 */
- (void)againAction{

   
        [self.mesView removeFromSuperview];//移除弹框
        
        [self.coverView removeFromSuperview];//移除遮罩
        


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)fiveTextField:(UITextField *)sender {
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
