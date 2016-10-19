//
//  DayView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "DayView.h"
#import <Masonry.h>
@interface DayView()
@property (nonatomic , weak)UIView *shangwu;
@property (nonatomic,weak) UIView * xiawu;
@property (nonatomic,weak) UIView *wanshang;
@property (weak, nonatomic) IBOutlet UIView *kongbai;

@end
@implementation DayView
//226 255 242

- (UIView *)shangwu
{
    if (!_shangwu) {
        UIView *shang = [UIView new];
        shang.layer.borderWidth =1;
          shang.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        [self addSubview:shang];
        _shangwu = shang;
    }
    return _shangwu;
}

-(UIView *)xiawu
{
    if (!_xiawu) {
        UIView *shang = [UIView new];
        shang.layer.borderWidth =1;
        shang.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        [self addSubview:shang];
        _xiawu = shang;
    }
    return _xiawu;
}

-(UIView *)wanshang
{
    if (!_wanshang) {
        UIView *shang = [UIView new];
        shang.layer.borderWidth =1;
        shang.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        [self addSubview:_wanshang];
        _wanshang = shang;
    }
    return _wanshang;
}
- (instancetype)init
{
    if (self = [super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"baseHospitalView" owner:self options:nil][2];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
//        }
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    __block CGFloat h = (self.frame.size.height - 40)/3;
    [self.shangwu makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.kongbai.bottom);
        make.left.right.equalTo(self);
        make.height.equalTo(51.5);
    }];
    
    [self.xiawu makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangwu.bottom);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(51.5);
    }];
    
    [self.wanshang makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
         make.height.equalTo(48);
    }];
    
    UILabel *a = [UILabel new];
    a.text = @"上午";
    a.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    [self.shangwu addSubview:a];
    a.numberOfLines = 0;
    [a makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(20);
        make.top.equalTo(self.kongbai.bottom);
        make.centerX.equalTo(self.kongbai);
        make.height.equalTo(48);
    }];
    
    UILabel *b = [UILabel new];
    b.text = @"下午";
    b.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    [self.xiawu addSubview:b];
    b.numberOfLines = 0;
    [b makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(20);
        make.top.equalTo(self.shangwu.mas_bottom);
        make.centerX.equalTo(self.shangwu);
        make.height.equalTo(50);
    }];
    
    UILabel *c = [UILabel new];
    c.text = @"晚上";
    c.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
    [self addSubview:c];
    c.numberOfLines = 0;
    [c makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(20);
        make.height.equalTo(50);
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
    }];
}

@end
