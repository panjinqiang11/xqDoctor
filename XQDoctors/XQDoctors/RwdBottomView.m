


//
//  RwdBottomView.m
//  RwdBottomView
//
//  Created by 任文迪 on 16/6/30.
//  Copyright © 2016年 spaceX. All rights reserved.
//

#import "RwdBottomView.h"
#import "Masonry.h"
#import "addRecordController.h"
@interface RwdBottomView()

@property(weak,nonatomic)UIButton *btn ;

@end

@implementation RwdBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        //设置那个大按钮
        UIButton *btn = [[UIButton alloc]init];
        
        [btn setTitle:@"添加病历" forState:UIControlStateNormal];
        
        [self addSubview:btn];
        
        [btn setBackgroundColor:[UIColor colorWithRed:47/255.0 green:198/255.0 blue:196/255.0 alpha:1.0]];
        
        [btn setFont:[UIFont systemFontOfSize:24]];
        
        [ btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.mas_centerX);
            
            make.centerY.equalTo(self.mas_centerY);
            
            make.size.mas_equalTo(CGSizeMake(self.bounds.size.width - 80, self.bounds.size.height - 30));
            
        }];
        
        self.btn = btn;
        
        [btn addTarget:self action:@selector(jumpToRecord) forControlEvents:UIControlEventTouchUpInside];
        
        btn.layer.cornerRadius = 10;
        
    }
    
    return self;//进行时  view will appear     view will disappear
}


-(void)jumpToRecord{
    
    if (self.jumpVcBlock){
        self.jumpVcBlock(@"跳转");
    }
    
  
}

@end
