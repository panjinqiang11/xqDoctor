//
//  CCHospitalHeaderView.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "CCHospitalHeaderView.h"
#import "CCButton.h"
#import "Masonry.h"
#import "UIImage+CCImg.h"

@interface CCHospitalHeaderView()
@property (nonatomic,weak)CCButton *leftButton;
@property (nonatomic,weak)CCButton *rightButton;
@property (nonatomic , strong) UIImage *rightImage;
@end
@implementation CCHospitalHeaderView

- (CCButton *)leftButton
{
    if (!_leftButton) {
        CCButton *btn = [[CCButton alloc] init];
        [btn setTitle:@"医院等级" forState:UIControlStateNormal];
        [btn setImage:self.rightImage forState:UIControlStateNormal];
        [self addSubview:btn];
        _leftButton = btn;
  }
    return _leftButton;
}

- (UIImage *)rightImage
{
    if (!_rightImage) {
        _rightImage = [UIImage imageNamed:@"箭头"];
        _rightImage = [_rightImage scaleToSize:_rightImage size:CGSizeMake(20, 20)];
    }
    return _rightImage;
}

- (CCButton *)rightButton
{
    if (!_rightButton) {
        CCButton *btn = [[CCButton alloc] init];
        [btn setTitle:@"医院地区" forState:UIControlStateNormal];
        [btn setImage:self.rightImage forState:UIControlStateNormal];
        [self addSubview:btn];
        _rightButton = btn;
    }
    return _rightButton;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
            __block float w = self.frame.size.width;
            __block float h = self.frame.size.height;
    //医院等级布局
    [self.leftButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(w/2.0);
        make.height.equalTo(h);
        make.left.equalTo(self);
        make.top.equalTo(self);
    }];
    //医院地区布局
    [self.rightButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(w/2.0);
        make.height.equalTo(h);
        make.top.equalTo(self);
        make.right.equalTo(self);
    }];
}
@end
