//
//  NetWorkTool.h
//  XQDoctors
//
//  Created by kassia on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
typedef void(^FinishedBlock) (id result);
@interface NetWorkTool : AFHTTPSessionManager


+ (instancetype)sharedNetWorkTool;
//POST请求方法
- (void)objectWithURLString:(NSString *)URLString paramDict:(NSDictionary *)param finishedBlock:(FinishedBlock)finishedBlock;
//GET请求方法
- (void)objectGetWithURLString:(NSString *)URLString paramDict:(NSDictionary *)param finishedBlock:(FinishedBlock)finishedBlock;
@end
