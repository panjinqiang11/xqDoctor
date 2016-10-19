//
//  EnterTools.h
//  XQDoctors
//
//  Created by li on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

//判断登录状态的的单例
@interface EnterTools : NSObject

//yes为登录,no为未登录
@property (nonatomic, assign) BOOL isOnline;

//登录状态的单例
+ (instancetype)sharedIsEnter;

@end
