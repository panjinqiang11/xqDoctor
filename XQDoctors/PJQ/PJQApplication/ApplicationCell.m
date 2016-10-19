//
//  ApplicationCell.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "ApplicationCell.h"
@interface ApplicationCell()


@end
@implementation ApplicationCell

- (void)awakeFromNib {
    // Initialization code
    //裁剪label
    self.check.layer.cornerRadius = 25;
    self.check.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(ApplicationModel *)model{
    
    _model = model;
    
    self.check.text = model.application;
    
    
}


@end
