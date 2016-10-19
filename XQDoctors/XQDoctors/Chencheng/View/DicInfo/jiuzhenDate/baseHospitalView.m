//
//  baseHospitalView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "baseHospitalView.h"

@interface baseHospitalView ()
@property (weak, nonatomic) IBOutlet UILabel *hosLabel;


@end
@implementation baseHospitalView

- (instancetype)init
{
    if (self = [super init]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"baseHospitalView" owner:self options:nil] firstObject];
        [self.hosLabel sizeToFit];
    }
    return self;
}


@end
