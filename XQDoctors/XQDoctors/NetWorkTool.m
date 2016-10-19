//
//  NetWorkTool.m
//  XQDoctors
//
//  Created by kassia on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool
+ (instancetype)sharedNetWorkTool{
    
    static NetWorkTool *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:@"http://iosapi.itcast.cn/doctor/"]];
        _instance.requestSerializer = [AFJSONRequestSerializer serializer];
        
        _instance.responseSerializer.acceptableContentTypes = [_instance.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    });
    return _instance;
}
- (void)objectWithURLString:(NSString *)URLString paramDict:(NSDictionary *)param finishedBlock:(FinishedBlock)finishedBlock{
    //发送网络请求
    [self POST:URLString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //通过block返回参数
        if (finishedBlock) {
            finishedBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];

}
//GET请求
- (void)objectGetWithURLString:(NSString *)URLString paramDict:(NSDictionary *)param finishedBlock:(FinishedBlock)finishedBlock{
    
    [self GET:URLString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //通过block返回参数
        if (finishedBlock) {
            finishedBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
    
}

@end
