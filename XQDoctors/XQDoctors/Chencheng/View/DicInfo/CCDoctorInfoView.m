//
//  CCDoctorInfoView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCDoctorInfoView.h"
#import "UIImage+CCImg.h"
@interface CCDoctorInfoView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//赵医生
@property (weak, nonatomic) IBOutlet UILabel *dutyLabel;//主任医师

@property (weak, nonatomic) IBOutlet UILabel *beijingLabel;//北京协和医院

@property (weak, nonatomic) IBOutlet UIButton *daoshiBtn;//导师
@property (weak, nonatomic) IBOutlet UIButton *starB;//星星
@property (weak, nonatomic) IBOutlet UIView *btnView;




@end
@implementation CCDoctorInfoView
//导师点击按钮
- (IBAction)daoshiButton:(UIButton *)sender {
    

    
}
- (IBAction)starBtn:(UIButton *)sender {
}

- (instancetype)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"CCDoctorInfoView" owner:self options:nil] firstObject];
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    

    
}

@end
