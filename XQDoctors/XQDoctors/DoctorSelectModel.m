//
//  DoctorSelectModel.m
//  XQDoctors
//
//  Created by li on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "DoctorSelectModel.h"
#import "NetWorkTool.h"

@implementation DoctorSelectModel


+ (instancetype)initWithDict:(NSDictionary *)dict{

    id model = [[DoctorSelectModel alloc]init];
   
    [model setValuesForKeysWithDictionary:dict];

    return model;

}
//避免网络数据中参数与属性不完全匹配而报错
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

+ (void)modelWithUrl:(NSString *)str andParam:(NSDictionary *) param andfinishBlock:(modelNet)modelBlock{
    
    [[NetWorkTool sharedNetWorkTool] objectWithURLString:str paramDict:param finishedBlock:^(id result) {
        
        //1.转成字典
        NSDictionary *dict = (NSDictionary *)result;
        
        //2.通过headline_ad,取出是字典数组
        NSArray *dictArray = dict[@"data"];
        
        //3.遍历字典数组,将里面的每一个字典转成模型,然后加到可变数组中
        NSMutableArray *cycles = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            //3.1 字典转模型
            DoctorSelectModel *model = [DoctorSelectModel initWithDict:dict];
            
            //3.2 添加到可变的数组中
            [cycles addObject:model];
        }
        
        if (modelBlock) {
            modelBlock(cycles.copy);
        }
        
        
        
        
    }];


}

@end
