//
//  personDataModel.m
//  XQDoctors
//
//  Created by kassia on 16/7/2.
//  Copyright © 2016年 li. All rights reserved.
//

#import "personDataModel.h"
#import "NetWorkTool.h"
#import "AFNetworking.h"
@implementation personDataModel
+ (instancetype)personWithDict:(NSDictionary *)dict{
    
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
+ (void)returnWithURLString:(NSString *)URLString finishBlock:(PersonBlock)personBlock{
    
    //创建单例
    NetWorkTool *netTool = [NetWorkTool sharedNetWorkTool];
    
    //参数
    NSDictionary *param = @{@"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f"};
    ;
    
    netTool.responseSerializer.acceptableContentTypes = [netTool.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    //将请求的数据改为JSON格式
    netTool.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //发送post请求
    [netTool objectWithURLString:URLString paramDict:param finishedBlock:^(id result) {
        
        NSDictionary *dict = (NSDictionary *)result;
        //2.通过data,取出是字典
        NSDictionary *dict1 = dict[@"data"];
        
        //3.遍历字典数组,将里面的每一个字典转成模型,然后加到可变数组中
        NSMutableArray *persondatas = [[NSMutableArray alloc]init];
        
        // for (NSDictionary *dict in dict1) {
        //3.1 字典转模型
        personDataModel *person = [personDataModel personWithDict:dict1];
        
        //3.2 添加到可变的数组中
        [persondatas addObject:person];
        
        NSLog(@"基本资料%@",persondatas);
        
        // }
        
        if (personBlock) {
            
            personBlock(persondatas.copy);
        }
        
    }];
}
- (NSString *)description{
    return [NSString stringWithFormat:@"%@,%d,%f,%@,%@,%@,%f,%d,%@",_true_name,_age,_height,_true_name,_mobile_number,_card_number,_weight,_gender,_head_photo];
    
}

+ (instancetype)sharedPersonDataModel{
    
    static personDataModel *_person;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [[personDataModel alloc]init];
        
        [self returnWithURLString:@"carelinkQuickLogin.json.php" finishBlock:^(NSArray *result) {
            _person = result.lastObject;
        }];
        
    });
    
    return _person;
}
@end
