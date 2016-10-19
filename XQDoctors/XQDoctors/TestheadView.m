

//
//  headView.m
//  testTableHeadView
//
//  Created by 任文迪 on 16/6/30.
//  Copyright © 2016年 spaceX. All rights reserved. 217 224 229
//

#import "TestheadView.h"
#import "Masonry.h"
#import "PersonDataController.h"

@implementation TestheadView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
        
        [self addSubview:iconView];
        
        iconView.backgroundColor = [UIColor colorWithRed:217/255.0 green:224/255.0 blue:229/255.0 alpha:1.0];
        
        iconView.layer.cornerRadius = 5;
        //设置头像的约束
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
           //居上15
            make.top.equalTo(self.mas_top).mas_equalTo(15);
            //距左10
            make.left.equalTo(self.mas_left).mas_equalTo(10);
            
            make.size.mas_equalTo(CGSizeMake(100, 100));
            
        }];
        
        //设置下方的点击按钮  47  198 196
        UIButton *btn = [[UIButton alloc]init];
        
        [btn setTitle:@"修改信息" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor colorWithRed:47/255.0 green:198/255.0 blue:196/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"input.png"] forState:UIControlStateNormal];
        
        btn.layer.borderColor = [UIColor colorWithRed:47/255.0 green:198/255.0 blue:196/255.0 alpha:1.0].CGColor;
        
        btn.layer.borderWidth = 1;
        
        btn.layer.cornerRadius = 5;
        
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.mas_left).mas_equalTo(10);
            
            make.top.equalTo(iconView.mas_bottom).mas_equalTo(20);
            
            make.bottom.equalTo(self.mas_bottom).mas_equalTo(-20);
            
            make.width.mas_equalTo(100);
            
        }];
        
        [btn addTarget:self action:@selector(jumpToTest:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //设置右侧栏
        UIView *lineView = [[UIView alloc]init];
        
        lineView.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(iconView.mas_right).mas_equalTo(20);
            
            make.right.equalTo(self.mas_right).mas_equalTo(0);
            
            make.height.mas_equalTo(1);
            
            make.top.equalTo(self.mas_top).mas_equalTo(50);
            
        }];
        //第二条线
        
        UIView *line1View = [[UIView alloc]init];
        
        line1View.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:line1View];
        
        [line1View mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(iconView.mas_right).mas_equalTo(20);
            
            make.right.equalTo(self.mas_right).mas_equalTo(0);
            
            make.height.mas_equalTo(1);
            
            make.top.equalTo(lineView.mas_top).mas_equalTo(50);
            
        }];
        //第三条线
        UIView *line2View = [[UIView alloc]init];
        
        line2View.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:line2View];
        
        [line2View mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(iconView.mas_right).mas_equalTo(20);
            
            make.right.equalTo(self.mas_right).mas_equalTo(0);
            
            make.height.mas_equalTo(1);
            
            make.top.equalTo(line1View.mas_top).mas_equalTo(50);
            
        }];
        
        //添加姓名等标签
        //个人信息
        UIImageView *iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"02.png"]];
        
        [self addSubview:iconImage];
        
        [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(25, 25));
            
            make.left.equalTo(iconView.mas_right).mas_equalTo(22);
            
            make.bottom.equalTo(lineView.mas_top).mas_equalTo(-12);
            
        }];
        //地址
        UIImageView *labelImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"04.png"]];
        
        [self addSubview:labelImage];
        
        [labelImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(25, 25));
            
            make.left.equalTo(iconView.mas_right).mas_equalTo(22);
            
            make.bottom.equalTo(line1View.mas_top).mas_equalTo(-12);
            
        }];
        //ID
        UIImageView *IDImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"03.png"]];
        
        [self addSubview:IDImage];
        
        [IDImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(25, 25));
            
            make.left.equalTo(iconView.mas_right).mas_equalTo(22);
            
            make.bottom.equalTo(line2View.mas_top).mas_equalTo(-12);
            
        }];
        //手机
        UIImageView *phoneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"05.png"]];
        
        [self addSubview:phoneImage];
        
        [phoneImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(25, 25));
            
            make.left.equalTo(iconView.mas_right).mas_equalTo(22);
            
            make.bottom.equalTo(self.mas_bottom).mas_equalTo(-12);
            
        }];
        
        
        //如果有模型输入 添加标签等
        
        //姓名标签
        UILabel *nameLabel = [[UILabel alloc]init];
        
        nameLabel.text = @"王大锤";
        
        nameLabel.textColor = [UIColor grayColor];
        
        [self addSubview:nameLabel];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerY.equalTo(iconImage.mas_centerY);
            
            make.left.equalTo(iconImage.mas_right).mas_equalTo(8);
            
        }];
        //性别标签
        UILabel *sexLabel = [[UILabel alloc]init];
        
        sexLabel.text = @"男";
        
        sexLabel.textColor = [UIColor grayColor];
        
        [self addSubview:sexLabel];
        
        [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(nameLabel.mas_right).mas_equalTo(15);
            
            make.centerY.equalTo(iconImage.mas_centerY);
            
        }];
        
        //年龄label
        UILabel *ageLabel = [[UILabel alloc]init];
        
        ageLabel.text = @"24";
        
        ageLabel.textColor = [UIColor grayColor];
        
        [self addSubview:ageLabel];
        
        
        [ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
           make.left.equalTo(sexLabel.mas_right).mas_equalTo(15);
            
            make.centerY.equalTo(iconImage.mas_centerY);
            
        }];
        
        //岁label
        UILabel *suiLabel = [[UILabel alloc]init];
        
        suiLabel.text = @"岁";
        
        suiLabel.textColor = [UIColor grayColor];
        
        [self addSubview:suiLabel];
        
        [suiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(iconImage.mas_centerY);
            
            make.left.equalTo(ageLabel.mas_right).mas_equalTo(2);
            
        }];
        
        //地区label
        UILabel *locationLabel = [[UILabel alloc]init];
        
        locationLabel.text = @"北京市昌平区";
        
        locationLabel.textColor = [UIColor grayColor];
        
        [self addSubview:locationLabel];
        
        [locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(labelImage.mas_centerY);
            
            make.left.equalTo(labelImage.mas_right).mas_equalTo(15);
            
        }];
        
        //IdLabel
        
        UILabel *Idlabel = [[UILabel alloc]init];
        
        Idlabel.text = @"4201071991727231231";
        
        Idlabel.textColor = [UIColor grayColor];
        
        [self addSubview:Idlabel];
        
        [Idlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(IDImage.mas_centerY);
            
            make.left.equalTo(IDImage.mas_right).mas_equalTo(15);
            
        }];
        
        //phoneNum
        
        UILabel *phoneNum = [[UILabel alloc]init];
        
        phoneNum.text = @"13000000000";
        
        phoneNum.textColor = [UIColor grayColor];
        
        [self addSubview: phoneNum];
        
        [phoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerY.equalTo(phoneImage.mas_centerY);
            
            make.left.equalTo(phoneImage.mas_right).mas_equalTo(15);
            
        }];
        
        
    }
    
    
    return self;
}

- (void)jumpToTest:(UIButton *)sender{
    
    if (self.jump) {
        
        self.jump(sender);
        
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
