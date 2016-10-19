//
//  loginHeadView.m
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "loginHeadView.h"


@implementation loginHeadView

//登录按钮
- (IBAction)loginButton:(UIButton *)sender {
    

    if(self.loginBlock){
    //1代表跳转登录
        self.loginBlock(1);
    
    }
    
}
- (IBAction)registerButton:(UIButton *)sender {
    
    if(self.loginBlock){
        //0代表跳转注册
        self.loginBlock(0);
        
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
