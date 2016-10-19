//
//  PJFootView.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PJFootView.h"

@implementation PJFootView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    
    return  [[NSBundle mainBundle]loadNibNamed:@"PJfootView" owner:nil options:nil].lastObject;
    

}


- (IBAction)clikButton:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(nextDay)]) {
    [self.delegate nextDay];
    }
    
}
- (IBAction)lastDay:(id)sender {
    if([self.delegate respondsToSelector:@selector(lastDay)]) {
        [self.delegate lastDay];
    }

}

@end
