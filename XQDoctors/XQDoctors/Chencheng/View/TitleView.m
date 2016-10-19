//
//  TitleView.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "TitleView.h"
@interface TitleView()
@property (weak, nonatomic) IBOutlet UILabel *hpName;  //医院名
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;//医院等级

@property (weak, nonatomic) IBOutlet UILabel *localLabel;//医院地址
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;//距离


@end
@implementation TitleView

- (instancetype)init
{
    if (self = [super init]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"TitleView" owner:self options:nil].firstObject;
        
            }
    return self;
}



@end
