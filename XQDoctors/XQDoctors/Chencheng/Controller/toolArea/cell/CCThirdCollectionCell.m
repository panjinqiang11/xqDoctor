//
//  CCThirdCollectionCell.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCThirdCollectionCell.h"
#import "CCBaseView.h"
@interface CCThirdCollectionCell()
@property (nonatomic,weak)CCBaseView *baseView;//就诊时间最外层的view
@end
@implementation CCThirdCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (CCBaseView *)baseView
{
    if (!_baseView) {
        CCBaseView *base = [CCBaseView new];
        [self addSubview:base];
        _baseView = base;
    }
    return _baseView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //baseView的布局
    [self.baseView makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.left.equalTo(self);
    }];
}
@end
