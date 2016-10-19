//
//  BtnButton.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "BtnButton.h"

@implementation BtnButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect imgF = CGRectMake(6, 15, 18, 18);
    CGRect labF = self.titleLabel.frame;
    labF.origin.x = 25;
    labF.origin.y = 15;
    labF.size.width = 80;
    self.titleLabel.frame = labF;
    self.imageView.frame = imgF;
    
}
@end
