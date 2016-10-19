//
//  PJappointModel.h
//  XQDoctors
//
//  Created by 潘金强 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^finishBlock)(id result);
@interface PJappointModel : NSObject
@property(nonatomic,copy)NSString *time;

@property(nonatomic,copy)NSString *doctor;

@property(nonatomic,copy)NSString *hospital;
+(instancetype)initWith:(NSDictionary *)dic;
+(void)objectWtihUrl:(NSString *)urlStr finishBlock:(finishBlock)finishBlock;
@end
