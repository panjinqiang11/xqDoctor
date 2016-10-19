//
//  CycleModel.m
//  XQDoctor
//
//  Created by kassia on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CycleModel.h"
#import "AFNetworking.h"
#import "NetWorkTool.h"
@implementation CycleModel

+ (instancetype)cycleWithDict:(NSDictionary *)dict{

     id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

//防止崩溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

/**
 *  解析JSON
 *
*/
+ (void)arrayWithURLString:(NSString *)URLString finishBlock:(FinishBlock)finishBlock{

    //创建单例
    NetWorkTool *netTool = [NetWorkTool sharedNetWorkTool];
    
    //参数
    NSDictionary *param = @{@"page_size":@10,@"page":@1
                            };
    
    netTool.responseSerializer.acceptableContentTypes = [netTool.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    //将请求的数据改为JSON格式
    netTool.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //发送post请求
    [netTool objectWithURLString:URLString paramDict:param finishedBlock:^(id result) {
        
        //1.转成字典
        NSDictionary *dict = (NSDictionary *)result;
        
        //2.通过data,取出是字典
        NSDictionary *dict1 = dict[@"data"];
        
        //通过banners 取出字典数组
        NSArray *dictArray = dict1[@"banners"];
        
        //3.遍历字典数组,将里面的每一个字典转成模型,然后加到可变数组中
        NSMutableArray *cycles = [NSMutableArray arrayWithCapacity:dictArray.count];
        
        for (NSDictionary *dict in dictArray) {
            //3.1 字典转模型
            CycleModel *cycle = [CycleModel cycleWithDict:dict];
            
            //3.2 添加到可变的数组中
            [cycles addObject:cycle];
            
        }
        
        if (finishBlock) {
            finishBlock(cycles.copy);
        }
    }];}
- (NSString *)description{

    return [NSString stringWithFormat:@"%@",_banner_img_url];
}
@end
