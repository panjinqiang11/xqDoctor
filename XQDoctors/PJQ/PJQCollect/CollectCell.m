//
//  CollectCell.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CollectCell.h"
#import "UIImageView+WebCache.h"

@interface CollectCell()
//医生姓名
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//医院名
@property (weak, nonatomic) IBOutlet UILabel *hospitalName;
//鲜花数
@property (weak, nonatomic) IBOutlet UILabel *flowerNum;
//锦旗数
@property (weak, nonatomic) IBOutlet UILabel *flagNum;
//手术次数
@property (weak, nonatomic) IBOutlet UILabel *opterationNum;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
@implementation CollectCell
-(void)setModel:(PJCollectModel *)model{
    _model = model ;
    
    self.nameLabel.text = model.doctor_name;
    
    self.hospitalName.text = model.doctor_hospital_name;
    
    self.flowerNum.text = [NSString stringWithFormat:@"%ld",(long)model.flower];
    
    self.flagNum.text = [NSString stringWithFormat:@"%ld",(long)model.banner];
    
    
    self.opterationNum.text = [NSString stringWithFormat:@"%ld",(long)model.banner];
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.doctor_portrait]];
    
    self.img.layer.cornerRadius = 32.5;
    self.img.layer.masksToBounds = YES;
    
}

@end
