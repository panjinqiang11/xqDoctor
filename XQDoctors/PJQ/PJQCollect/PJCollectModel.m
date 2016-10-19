//
//  PJCollectModel.m
//  XQDoctors
//
//  Created by 潘金强 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PJCollectModel.h"
#import "NetWorkTool.h"
@implementation PJCollectModel
+(instancetype)initWith:(NSDictionary *)dic{
    
    PJCollectModel *model = [PJCollectModel new];
    
    [model setValuesForKeysWithDictionary:dic];
    
    return  model;
    
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    
}
+(void)objectWtihUrl:(NSString *)urlStr dic:(NSDictionary *)dic finishBlock:(finishBlock)finishBlock{
    
    
    NetWorkTool *tool = [NetWorkTool sharedNetWorkTool];
    
    tool.requestSerializer = [AFJSONRequestSerializer serializer];
    
//    tool.responseSerializer = [AFHTTPResponseSerializer serializer];
    [tool objectWithURLString:urlStr paramDict:dic finishedBlock:^(id result) {
        
        //NSDictionary *dicarr = [NSJSONSerialization JSONObjectWithData:result options:0 error:NULL];
        
//        NSString *key = dicarr.allKeys.lastObject;
        
        NSArray *Dictarr = result[@"data"];
        
        NSMutableArray *mu = [NSMutableArray array];
        for(NSDictionary *dic in Dictarr){
            
            PJCollectModel *model = [PJCollectModel initWith:dic];
            
            [mu addObject:model];
            
        }
        
        if(finishBlock) {
            
            finishBlock(mu);
        }
        
        
    }];

}





@end
