//
//  rwdfooterView.m
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "rwdfooterView.h"

@implementation rwdfooterView


- (void)awakeFromNib {
    self.backgroundColor = [UIColor yellowColor];
}


+(instancetype)loadNib{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"footer" owner:nil options:nil] lastObject];
    
    
}
- (IBAction)clickAction:(UIButton *)sender {
    
    if (self.jumpToRecord) {
    
        _jumpToRecord(sender);
        
   }
    
}
@end
