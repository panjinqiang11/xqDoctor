//
//  PJHeadView.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PJHeadView.h"

@implementation PJHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    
    return  [[NSBundle mainBundle]loadNibNamed:@"PJhead" owner:nil options:nil].lastObject;
    
    
}

- (IBAction)clickCalendar:(UIButton *)sender {
    
    if([self.delegate respondsToSelector:@selector(clikCalendar)]) {
        [self.delegate clikCalendar];
    }
    

}
@end
