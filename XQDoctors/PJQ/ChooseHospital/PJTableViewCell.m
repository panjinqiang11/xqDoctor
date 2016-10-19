//
//  PJTableViewCell.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PJTableViewCell.h"
#import "PJModel.h"
@interface PJTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *resource;

@property (weak, nonatomic) IBOutlet UIButton *appointButton;

@end
@implementation PJTableViewCell
-(void)setModel:(PJModel *)model{
    
    _model = model;
    
    self.price.text = model.price;
    
    self.resource.text = model.resource;
    
    [self.appointButton setTitle:model.buttonLabel forState:UIControlStateNormal];
    
    if([model.buttonLabel isEqualToString:@"不可预约"]) {
        
        self.appointButton.enabled = NO;
    }else{
        self.appointButton.enabled = YES;
    }
}
- (IBAction)clikAppointButton:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(appoint)]) {
        [self.delegate appoint];
        
    }
}



@end
