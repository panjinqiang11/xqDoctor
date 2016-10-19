//
//  settingModel.m
//  XQDoctor
//
//  Created by 任文迪 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "settingModel.h"

@implementation settingModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    
}

+(instancetype)settingWithDict:(NSDictionary *)dict{
    
    
    return [[self alloc]initWithDict:dict];
    
}

+(NSArray *)settingModelsWithPlistName:(NSString *)plistName{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSArray *array = dict[@"item"];
    
    NSMutableArray *mutArr = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        settingModel *model = [settingModel settingWithDict:dict];
        
        [mutArr addObject:model];
        
    }
    return mutArr.copy;
    
}

@end
