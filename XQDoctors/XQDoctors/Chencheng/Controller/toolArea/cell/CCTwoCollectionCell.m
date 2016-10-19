//
//  CCTwoCollectionCell.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//
//医生简介
#import "CCTwoCollectionCell.h"
#import "UIImage+CCImg.h"
@interface CCTwoCollectionCell()
@property (nonatomic , weak)UIView *dutyView;//职称
@property (nonatomic , weak)UIView *dutyOne;//职称1
@property (nonatomic , weak)UIView *dutyTwo;//职称2
@property (nonatomic , weak)UIScrollView *infoScrollView;//医生详细信息
@property (nonatomic , weak)UILabel *contentLabel; //描述信息
@property (nonatomic, strong)UILabel *la;//职称1
@property (nonatomic, strong)UILabel *la1;//职称2

@end
@implementation CCTwoCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self.sqBtn addTarget:self action:@selector(applyBtnClick:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

-(UILabel *)la1
{
    if (!_la1) {
        _la1 = [UILabel new];
        _la1.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
        _la1.font = [UIFont systemFontOfSize:15];
    }
    return _la1;
}

- (UILabel *)la
{
    if (!_la) {
        _la = [UILabel new];
        _la.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
        _la.font = [UIFont systemFontOfSize:15];
    }
    return _la;
}


//描述信息
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        
        UILabel *label = [UILabel new];
        [self.infoScrollView addSubview:label];
        NSMutableString *str = [NSMutableString string];
        for (int i =0 ; i <50; i++) {
            [str appendString:@"你是我的小呀小苹果"];
        }
        _contentLabel = label;
        _contentLabel.textColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1];
        label.font = [UIFont systemFontOfSize:15];
        NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:str];
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:8];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [str length])];
        [_contentLabel setAttributedText:attributedString1];
        [_contentLabel sizeToFit];
        
        
    }
    _contentLabel.numberOfLines = 0;
    return _contentLabel;
}
//医生详细信息
- (UIScrollView *)infoScrollView
{
    if (!_infoScrollView) {
        
        UIScrollView *sc = [UIScrollView new];
        [self addSubview:sc];
        _infoScrollView = sc;
        _infoScrollView.contentSize = CGSizeMake(0, 500);
        _infoScrollView.showsVerticalScrollIndicator = NO;
        _infoScrollView.showsHorizontalScrollIndicator = NO;
        _infoScrollView.bounces = NO;
    }
    return _infoScrollView;
}

//职称
- (UIView *)dutyView
{
    if (!_dutyView) {
        UIView *duty = [UIView new];
        [self addSubview:duty];
        duty.backgroundColor = [UIColor yellowColor];
        _dutyView = duty;
        _dutyView.layer.cornerRadius =2;
        _dutyView.clipsToBounds = YES;
    }
    return _dutyView;
}
//职称1
- (UIView *)dutyOne
{
    if (!_dutyOne) {
        UIView *one = [UIView new];
        one.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:249/255.0 alpha:1];
        [self.dutyView addSubview:one];
       
        _dutyOne = one;
            }
    return _dutyOne;
}
- (UIView *)dutyTwo
{
    if (!_dutyTwo) {
        UIView *one = [UIView new];
        one.backgroundColor = [UIColor colorWithRed:242/255.0 green:245/255.0 blue:249/255.0 alpha:1];
        [self.dutyView addSubview:one];
        _dutyTwo = one;
    }
    return _dutyTwo;
}
//申请就诊点击效果
- (void)applyBtnClick:(UIButton *)btn
{
    NSLog(@"applyBtnClick");
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.dutyView makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(15.);
        make.right.equalTo(self).offset(-15);
        make.height.equalTo(60.);
    }];
    
    //职称1
    [self.dutyOne makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.dutyView);
        make.height.equalTo(30);
    }];
    //职称2
    [self.dutyTwo makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.dutyView);
        make.height.equalTo(30);
        
    }];
    
    UIImage *img = [UIImage imageNamed:@"绿色头像"];
    img  = [img scaleToSize:img size:CGSizeMake(20, 20)];
    UIImageView *image1 = [[UIImageView alloc] initWithImage:img];
    
    [self.dutyOne addSubview:image1];
    image1.frame = CGRectMake(10, 5, 20, 20);
    
    UIImageView *image2 = [[UIImageView alloc] initWithImage:img];
    
    [self.dutyTwo addSubview:image2];
    image2.frame = CGRectMake(10, 5, 20, 20);
    
    
    self.la.text = @"中国骨科学会足踝外科学组副组长";
    
    [self.dutyOne addSubview:self.la];
    [self.la makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.dutyOne);
        make.left.equalTo(self.dutyOne).offset(40.);
    }];
    
    
    //UILabel *la1 = [[UILabel alloc] init];
    self.la1.text = @"中国医师协会足踝外科工作委员会副主任";
    [self.dutyTwo addSubview:self.la1];
    [self.la1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.dutyTwo);
        make.left.equalTo(self.dutyTwo).offset(40.);
    }];
    
    //医生详细信息
    
    [self.infoScrollView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(20.);
        make.top.equalTo(self.dutyView.bottom).offset(20.);
        make.right.equalTo(self).offset(-20);
        make.bottom.equalTo(self.lineView.top).offset(-40);
    }];
    
    //详细信息
    __block CGFloat w = [UIScreen mainScreen].bounds.size.width - 40;
    [self.contentLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self.infoScrollView);
        make.width.equalTo(w);
    }];

    

}
@end
