//
//  TopWeakView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//
//上一周
#import "TopWeakView.h"
@interface TopWeakView()


@end
@implementation TopWeakView

- (instancetype)init
{
    if (self = [super init]) {
         self = [[NSBundle mainBundle] loadNibNamed:@"baseHospitalView" owner:self options:nil][1];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        
    }
   
    return self;
}
- (void)awakeFromNib
{
    __weak typeof (self)weakSelf = self;
    if (self.block) {
        self.block(0,weakSelf);
    }
    
}

- (void)giBlock
{
    if (self.block) {
        
        _block(0,self);
    }
}
//上一周
- (IBAction)nextWeak:(UIButton *)sender {
    self.weakLabel.text =@"第二周";
    [self.leftBtn setImage:[UIImage imageNamed:@"jiantou_left"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"gray_you"] forState:UIControlStateNormal];
    if (self.block) {
        
        _block(sender.tag,self);
    }
}

//下一周
- (IBAction)topweak:(UIButton *)sender {
    self.weakLabel.text =@"第一周";
    [self.leftBtn setImage:[UIImage imageNamed:@"gray_zuo"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"jiantou_right"] forState:UIControlStateNormal];
    if (self.block) {
        
        _block(sender.tag,self);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.block) {
        _block(0,self);
    }
}


@end
