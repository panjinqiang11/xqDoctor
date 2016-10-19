//
//  SyndromeModel.m
//  XQDoctors
//
//  Created by 张清 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import "SyndromeModel.h"
#import "NetWorkTool.h"
@implementation SyndromeModel

+(instancetype)dataModelWithDict:(NSDictionary *)dict
{
    SyndromeModel *model = [SyndromeModel new];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+(void)dataArrwithWithURLString:(NSString *)URLString paramDict:(NSDictionary *)param completeBlock:(CompleteBlock)completeBlock
{
    //创建网络单例对像
    NetWorkTool *netTool = [NetWorkTool sharedNetWorkTool];
    //添加响应格式
    netTool.responseSerializer.acceptableContentTypes = [netTool.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //将请求的数据改为JSON格式
    netTool.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [netTool objectWithURLString:URLString paramDict:param finishedBlock:^(id result) {
        NSDictionary *dict = (NSDictionary *)result;
        if ([dict[@"code"] integerValue] == 0)
        {
            NSArray *dictArr = dict[@"data"];
            NSMutableArray *modelArr = [NSMutableArray array];
            for (NSDictionary *dict in dictArr)
            {
                SyndromeModel *model = [SyndromeModel dataModelWithDict:dict];
                [modelArr addObject:model];
            }
            if (completeBlock)
            {
                completeBlock(modelArr.copy);
            }
        }
        else
        {
            NSLog(@"请求失败%@",dict);
        }
        
    }];
    
}



@end
