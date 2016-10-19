//
//  cityModel.m
//  XQDoctors
//
//  Created by kassia on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "cityModel.h"

@implementation cityModel
+ (instancetype)cityWithDict:(NSDictionary *)dict
{
    
    cityModel *model = [[cityModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}
@end
