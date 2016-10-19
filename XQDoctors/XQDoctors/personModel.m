//
//  personModel.m
//  XQDoctors
//
//  Created by kassia on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "personModel.h"

@implementation personModel
- (NSString *)description{
    return [NSString stringWithFormat:@"%@,%d,%d,%@,%lf,%lf,%@,%@",_name,_age,_sex,_adress,_height,_weight,_personID,_phoneNum];
}
@end
