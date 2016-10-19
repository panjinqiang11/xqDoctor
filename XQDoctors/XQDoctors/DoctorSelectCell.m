//
//  DoctorSelectCell.m
//  XQDoctors
//
//  Created by li on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "DoctorSelectCell.h"
#import "DoctorSelectModel.h"
#import <UIImageView+WebCache.h>

@interface DoctorSelectCell()

@property (weak, nonatomic) IBOutlet UIImageView *doctor_portrait;
@property (weak, nonatomic) IBOutlet UILabel *operation_count;
@property (weak, nonatomic) IBOutlet UILabel *banner;
@property (weak, nonatomic) IBOutlet UILabel *doctor_hospital_name;
@property (weak, nonatomic) IBOutlet UILabel *doctor_name;
@property (weak, nonatomic) IBOutlet UILabel *flower;
@property (weak, nonatomic) IBOutlet UILabel *doctor_title_name;
@property (weak, nonatomic) IBOutlet UILabel *accuracy;

@end
@implementation DoctorSelectCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(DoctorSelectModel *)model{

    _model = model;
    
    self.doctor_name.text = model.doctor_name;
    self.doctor_hospital_name.text = model.doctor_hospital_name;
    self.doctor_title_name.text = model.doctor_title_name;
    self.banner.text = [NSString stringWithFormat:@"%ld",(long)model.banner];
    self.flower.text = [NSString stringWithFormat:@"%ld",(long)model.flower];;
    self.accuracy.text = model.accuracy;
    self.operation_count.text = [NSString stringWithFormat:@"%ld",(long)model.operation_count];;
    [self.doctor_portrait sd_setImageWithURL:[NSURL URLWithString:model.doctor_portrait]];
    self.doctor_portrait.layer.cornerRadius = 32;
    self.doctor_portrait.layer.masksToBounds = YES;
}

@end
