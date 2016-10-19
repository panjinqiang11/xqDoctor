//
//  CCtitleFiled.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCtitleFiled.h"

@implementation CCtitleFiled


- (void)setSearchImage:(UIImage *)searchImage
{
    _searchImage =searchImage;
    self.rightViewMode = UITextFieldViewModeAlways;

    UIView *rightVeiw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    UIImageView *imageViews = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
    imageViews.image = searchImage;

    [rightVeiw addSubview:imageViews];
    self.rightView = rightVeiw;
}

- (void)setHolderName:(NSString *)holderName
{
    _holderName = holderName;
    self.placeholder = holderName;
    self.font = [UIFont systemFontOfSize:13];
}

@end
