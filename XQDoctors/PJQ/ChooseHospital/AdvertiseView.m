//
//  AdvertiseView.m
//  XQDoctors
//
//  Created by li on 16/7/2.
//  Copyright © 2016年 li. All rights reserved.
//

#import "AdvertiseView.h"

@implementation AdvertiseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)clikButton:(id)sender {
    if(self.btn) {
        
        self.btn();
    }
    
}
-(instancetype)init{
    
    return  [[NSBundle mainBundle]loadNibNamed:@"Advertisement" owner:nil options:nil].lastObject;
    
    
}

@end
