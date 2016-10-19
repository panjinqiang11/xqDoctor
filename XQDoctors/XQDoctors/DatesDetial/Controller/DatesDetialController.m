//
//  DatesDetialController.m
//  XQDoctors
//
//  Created by kassia on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "DatesDetialController.h"
#import <Masonry.h>
@interface DatesDetialController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;//头像
@property (weak, nonatomic) IBOutlet UILabel *seeTime;//就诊时间
@property (weak, nonatomic) IBOutlet UILabel *appSuccess;//申请成功
@property (weak, nonatomic) IBOutlet UIButton *mesResend;//短信重发
@property (weak, nonatomic) IBOutlet UIButton *reApplication;//重新申请
@property (weak, nonatomic) IBOutlet UIButton *aotoApplication;//自动重新申请
@property (weak, nonatomic) IBOutlet UIView *footLine;//底部的线

@property (weak, nonatomic) IBOutlet UIView *mesView;//重新申请时的view
@property (weak, nonatomic) IBOutlet UILabel *errorMsg;

@end

@implementation DatesDetialController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavigationItem]; //设置导航栏
    
    [self changeControllerView];
    
    self.mesView.hidden = YES;//隐藏mesView
}
/**
 *  跳转消息界面按钮
 */
- (IBAction)connectWithDoc:(UIButton *)sender {
    
}
/**
 *  跳转医生选择
 */
- (IBAction)reApplication:(UIButton *)sender {
    
}
/**
 *  自动申请
 */
- (IBAction)aotuApplicationBtn:(UIButton *)sender {
    
    self.mesView.hidden = NO;
    [sender addTarget:self action:@selector(aotuAction) forControlEvents:UIControlEventTouchDown];
}
/**
 *跳转再次申请后的下一个控制器---递交资料
 */
- (IBAction)againApplication:(UIButton *)sender {
    
    
}
//实现方法
- (void)aotuAction{

    

//    [self animationDidStop:self.mesView.ani finished:YES];
  
}
/**
 *  设置导航栏及裁剪
 */
- (void)setNavigationItem{

    self.navigationItem.title = @"预约详情";
    
    //对申请成功lable进行裁剪
    self.appSuccess.layer.cornerRadius = 25;
    self.appSuccess.layer.masksToBounds = YES;
    
}
- (void)changeControllerView{

 
    //隐藏错误信息
        self.errorMsg.hidden = YES;
    
   if ([self.appLable isEqualToString:@"已就诊"]) {
        
        /**
         *  隐藏该隐藏的,显示该显示的
         */
        self.footLine.hidden = YES;
        self.mesResend.hidden = YES;
        self.mesView.hidden = YES;
        self.errorMsg.hidden = YES;
       
        //设置颜色
        self.appSuccess.backgroundColor = [UIColor lightGrayColor];
       
       //设置文字
       self.appSuccess.text = @"已就诊";
       
    }else if ([self.appLable isEqualToString:@"申请失败"]){
    
        /**
         *  隐藏该隐藏的,显示该显示的
         */
        self.reApplication.hidden = NO;
        self.aotoApplication.hidden = NO;
        self.footLine.hidden = NO;
        self.mesResend.hidden = YES;
        
        self.errorMsg.hidden = NO;
        
//        self.mesView.hidden = NO;
        //设置颜色
        self.appSuccess.backgroundColor = [UIColor colorWithRed:(255 / 255.0) green:(189 / 255.0) blue:(205 / 255.0) alpha:1.0];
    
        //设置文字
        self.appSuccess.text = @"申请失败";
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
    
}



@end
