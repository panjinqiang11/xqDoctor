//
//  AppointCell.m
//  XQDoctor
//
//  Created by 潘金强 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "AppointCell.h"
#import "PJappointModel.h"
@interface AppointCell()
@property (weak, nonatomic) IBOutlet UILabel *hospital;

@property (weak, nonatomic) IBOutlet UILabel *doctor;

@property (weak, nonatomic) IBOutlet UILabel *appointTime;

@end
@implementation AppointCell
-(void)setModel:(PJappointModel *)model{
    _model = model;
    
    self.hospital.text = model.hospital;
    
    self.appointTime.text =  model.time;
    
    self.doctor.text = model.doctor;
    
}


@end
