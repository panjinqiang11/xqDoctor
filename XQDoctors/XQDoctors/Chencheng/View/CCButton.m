//
//  CCButton.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

- (void)setTitleTestLabel:(NSString *)titleTestLabel
{
    _titleTestLabel = titleTestLabel;
    self.titleLabel.text = titleTestLabel;
    
}




- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
    //得到label的frame
    CGRect labelFrame = self.titleLabel.frame;
    //得到image的frame
    CGRect imgFrame = self.imageView.frame;
    
    labelFrame.origin.x = (self.frame.size.width - (labelFrame.size.width+10+imgFrame.size.width))/2.0;
    imgFrame.origin.x = CGRectGetMaxX(labelFrame)+10;
    self.titleLabel.frame = labelFrame;
    self.imageView.frame = imgFrame;
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

}
@end
