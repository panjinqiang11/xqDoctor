//
//  hospitalModel.m
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "hospitalModel.h"

@implementation hospitalModel

+(instancetype)hospitalsWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


+(NSArray *)hospitals{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"hospital" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *array = dict[@"item"];
    
    NSMutableArray *mutArr = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        hospitalModel *model = [hospitalModel hospitalsWithDict:dict];
        
        [mutArr addObject:model];
        
    }
    
    return mutArr.copy;
    
}

@end
