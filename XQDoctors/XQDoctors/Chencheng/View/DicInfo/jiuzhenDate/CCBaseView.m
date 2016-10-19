//
//  CCBaseView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCBaseView.h"
#import "baseHospitalView.h"
#import "TopWeakView.h"
#import "DayView.h"
#import "GuaiHaoCollectionViewController.h"
@interface CCBaseView()
@property (nonatomic , weak)baseHospitalView *baseV;//坐诊医院
@property (weak, nonatomic) TopWeakView *topView;//上一周
@property (weak, nonatomic) DayView *leftView;//晚上 上午
@property (weak, nonatomic)UICollectionView *biaoGeView;//表格
@property (strong,nonatomic)GuaiHaoCollectionViewController *gua;
@end
@implementation CCBaseView

#pragma mark -- 表格view
- (UICollectionView *)biaoGeView
{
    if (!_biaoGeView) {
        self.gua = [[GuaiHaoCollectionViewController alloc] init:[UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.leftView.frame):self.leftView.frame.size.height];
        [self addSubview:self.gua.collectionView];
        _biaoGeView = self.gua.collectionView;
    }
    return _biaoGeView;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        //self.backgroundColor = [UIColor yellowColor];
        __block typeof (self)weakSelf = self;
        self.topView.block = ^(NSInteger number,TopWeakView *weakView)
        {
            weakSelf.gua.number = number;
            weakSelf.gua.weakView = weakView;
        };
        
    }
    return self;
}

- (baseHospitalView *)baseV
{
    if (!_baseV) {
        
        baseHospitalView *base =  [baseHospitalView new];
        [self addSubview:base];
        _baseV = base;
    }
    return _baseV;
}

#pragma mark -- 上一周
- (UIView *)topView
{
    if (!_topView) {
        TopWeakView *weakView = [[TopWeakView alloc] init];
        [self addSubview:weakView];
        _topView = weakView;
    }
    return _topView;
}

#pragma mark -- 晚上 ， 上午,下午
- (DayView *)leftView
{
    if (!_leftView) {
       
        DayView *day  = [[DayView alloc] init];
        [self addSubview:day];
        _leftView = day;
    }
    return _leftView;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.baseV makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(self);
        make.height.equalTo(150.);
    }];
    
    
    //上一周布局
//    
    [self.topView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.baseV.bottom);
        make.height.equalTo(40.);
    }];
    
    //上午,晚上布局
    [self.leftView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.bottom);
        make.left.bottom.equalTo(self);
        make.width.equalTo(40.);
    }];
    
    //表格
    [self.biaoGeView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.bottom);
        make.left.equalTo(self.leftView.right);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
   
}
@end
