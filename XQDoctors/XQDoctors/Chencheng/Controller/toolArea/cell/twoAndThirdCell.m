//
//  twoAndThirdCell.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//


#import "twoAndThirdCell.h"


@implementation twoAndThirdCell

- (UIView *)lineView
{
    if (!_lineView) {
        UIView *line = [[UIView alloc] init];
        [self addSubview:line];
        _lineView = line;
       
        _lineView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    }
    return _lineView;
}

- (UIButton *)sqBtn
{
    if (!_sqBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        _sqBtn = btn;
        [_sqBtn setTitle:@"申请就诊" forState:UIControlStateNormal];
        _sqBtn.backgroundColor = [UIColor colorWithRed:32/255.0 green:198/255.0 blue:198/255.0 alpha:1.0];
        _sqBtn.layer.cornerRadius = 2;
        [_sqBtn addTarget:self action:@selector(jiuzhenBtn) forControlEvents:UIControlEventTouchUpInside];
        _sqBtn.clipsToBounds = YES;
        
    }
    return _sqBtn;
}

- (void)jiuzhenBtn
{
    if (self.block) {
        self.block();
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    //分割线
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(2.);
        make.bottom.equalTo(self).offset(-65.);
        
    }];
    
    //申请就诊
    [self.sqBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.bottom.equalTo(self).offset(-10);
        make.height.equalTo(44);
    }];
    
}


@end
