//
//  ApplicationModel.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "ApplicationModel.h"

@implementation ApplicationModel
+(instancetype)initWithDic:(NSDictionary *)dic{
    
    ApplicationModel *model = [ApplicationModel new];
    //字典转模型
    [model setValuesForKeysWithDictionary:dic];
    //返回模型
    return  model;
}
+(NSArray *)info{
    
    NSArray *dicarr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"application.plist" ofType:nil]];
    NSMutableArray *mu = [NSMutableArray array];
    
    for(NSDictionary *dic in dicarr) {
        
        ApplicationModel *model = [ApplicationModel initWithDic:dic];
        
        [mu addObject:model];
    }
    return mu.copy;
}

@end
