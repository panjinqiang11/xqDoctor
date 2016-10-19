//
//  XQBaseButton.m
//  XQDoctor
//
//  Created by 张清 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "XQBaseButton.h"
#import "UIView+Frame.h"
@implementation XQBaseButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.x = 10;
    self.imageView.x = self.bounds.size.width - 35;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setTitleColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"右箭头"] forState:UIControlStateNormal];
        self.layer.borderColor = UICOLOR_WITH_RGBINT(0xcccccc).CGColor;
        self.layer.borderWidth = 1;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
     
        
    }
    return self;
}



@end
