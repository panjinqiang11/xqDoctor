//
//  DayDateView.m
//  XQDoctors
//
//  Created by 陈成 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import "DayDateView.h"

@implementation DayDateView

- (instancetype)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"DayDateView" owner:self options:nil] firstObject];
    }
    return self;
}

@end
