//
//  PJModel.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PJModel.h"

@implementation PJModel
+(instancetype)initWithDic:(NSDictionary *)dic{
    
    PJModel *model = [PJModel new];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}
+(NSMutableArray *)InfoArr{
    
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"PJTableViewCell" ofType:@"plist"]];
    
    NSMutableArray *mu = [NSMutableArray array];
    
    for(NSDictionary *dic in dicArr){
        
        PJModel *model = [PJModel initWithDic:dic];
        
        [mu addObject:model];
    }
    
    return mu;
    
    
}
@end
