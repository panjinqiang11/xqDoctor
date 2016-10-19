//
//  PJappointModel.m
//  XQDoctors
//
//  Created by 潘金强 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PJappointModel.h"
#import "AFNetworking.h"
#import "NetWorkTool.h"
@implementation PJappointModel
+(instancetype)initWith:(NSDictionary *)dic{
    PJappointModel *model = [PJappointModel new];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return  model;
    
    
}
+(void)objectWtihUrl:(NSString *)urlStr finishBlock:(finishBlock)finishBlock{
    
    //获取网络工具类`
    NetWorkTool *tool = [NetWorkTool sharedNetWorkTool];
    
    
    //调用网络工具类方法请求数据
    //调用网络工具类方法请求数据
    [ tool objectGetWithURLString:urlStr paramDict:nil finishedBlock:^(id result) {
        //用数组保存放回数据
        NSArray *dicarr = result;
        
        NSMutableArray *mu = [NSMutableArray array];
        
        for(NSDictionary *dic in dicarr){
            
            PJappointModel *model = [PJappointModel initWith:dic];
            
            [mu addObject:model];}
        
        if(finishBlock) {
            
            finishBlock(mu);
        }
        
    }
     ];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
    
    
    

@end
