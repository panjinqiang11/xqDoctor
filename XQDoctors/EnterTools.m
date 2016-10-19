//
//  EnterTools.m
//  XQDoctors
//
//  Created by li on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "EnterTools.h"

@implementation EnterTools

//登录状态单例创建
+ (instancetype)sharedIsEnter{

    static dispatch_once_t onceToken;
    static EnterTools *_enter;
    dispatch_once(&onceToken, ^{
        _enter = [[EnterTools alloc]init];
    });
    return _enter;

}

@end
