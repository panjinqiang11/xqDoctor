//
//  CCToolCollectionCell.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCToolCollectionCell.h"
@interface CCToolCollectionCell()
@property (nonatomic,weak)UILabel *topLabel;//接诊条件
@property (nonatomic , weak)UILabel *contentLabel;//接诊条件内容
@end
@implementation CCToolCollectionCell

//接诊条件
- (UILabel *)topLabel
{
    if (!_topLabel) {
        UILabel *la = [UILabel new];
        [self addSubview:la];
        _topLabel = la;
        la.text = @"接诊条件";
    }
    return _topLabel;
}
//接诊条件内容
-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *content = [UILabel new];
        [self addSubview:content];
        content.text = @"需要提供CT照需要提供病历  最好是确诊患者";
        content.numberOfLines = 0;
        content.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
        _contentLabel = content;
    }
    return _contentLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.sqBtn addTarget:self action:@selector(applyBtnClick:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

//申请就诊点击效果
- (void)applyBtnClick:(UIButton *)btn
{
    NSLog(@"applyBtnClick");
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //接诊条件
    [self.topLabel makeConstraints:^(MASConstraintMaker *make){
        make.left.top.equalTo(20.);
        
    }];
    //接诊条件内容
    [self.contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(20.);
        make.top.equalTo(self.topLabel).offset(30.);
        make.width.equalTo(120.);
    }];
    
}


@end
